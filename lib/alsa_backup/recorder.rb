require 'alsa'

module AlsaBackup
  class Recorder

    def initialize(file = "record.wav")
      @file = File.basename(file)
      @directory = File.dirname(file)

      @error_handler = Proc.new { |e| true }
    end

    attr_accessor :file, :directory, :error_handler

    def start(seconds_to_record = nil)
      length_controller = self.length_controller(seconds_to_record)

      Writer.open(directory, file, format(:format => "wav pcm_16")) do |writer|
        ALSA::PCM::Capture.open("hw:0", self.format(:sample_format => :s16_le)) do |capture|
          capture.read do |buffer, frame_count|
            writer.write buffer, frame_count
            length_controller.continue_after? frame_count
          end
        end
      end
    rescue Interrupt
      AlsaBackup.logger.debug('recorder interrupted')      
    rescue Exception => e
      AlsaBackup.logger.error(e)
      AlsaBackup.logger.debug { e.backtrace.join("\n") }

      if seconds_to_record.nil? and continue_on_error?(e)
        retry
      else
        raise e
      end
    end

    def continue_on_error?(e)
      error_handler_response = @error_handler.call(e) if @error_handler

      if error_handler_response
        sleep_time = Numeric === error_handler_response ? error_handler_response : 5
        AlsaBackup.logger.warn("sleep #{sleep_time}s before retrying")
        sleep sleep_time
      end

      error_handler_response
    end

    def format(additional_parameters = {})
      {:sample_rate => 44100, :channels => 2}.merge(additional_parameters)
    end

    def length_controller(seconds_to_record)
      if seconds_to_record
        AlsaBackup::LengthController::FrameCount.new format[:sample_rate] * seconds_to_record 
      else
        AlsaBackup::LengthController::Loop.new
      end
    end

  end

end
