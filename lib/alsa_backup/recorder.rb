require 'alsa'

module AlsaBackup
  class Recorder

    def initialize(file = "record.wav")
      @file = File.basename(file)
      @directory = File.dirname(file)

      @device = "hw:0"
      @sample_rate = 44100
      @channels = 2

      @error_handler = Proc.new { |e| true }
    end

    attr_accessor :file, :directory, :error_handler
    attr_accessor :device, :sample_rate, :channels

    def start(seconds_to_record = nil)
      length_controller = self.length_controller(seconds_to_record)

      open_writer do |writer|
        open_capture do |capture|
          capture.read do |buffer, frame_count|
            writer.write buffer, frame_count*format[:channels]
            length_controller.continue_after? frame_count
          end
        end
      end
    rescue Exception => e
      retry if handle_error(e, seconds_to_record.nil?)
    end

    def open_writer(&block)
      Writer.open(directory, file, format(:format => "wav pcm_16"), &block)     
    end

    def open_capture(&block)
      ALSA::PCM::Capture.open(device, format(:sample_format => :s16_le), &block)      
    end

    def handle_error(e, try_to_continue = true)
      if Interrupt === e
        AlsaBackup.logger.debug('recorder interrupted')      
        return false 
      end

      AlsaBackup.logger.error(e)
      AlsaBackup.logger.debug { e.backtrace.join("\n") }

      if try_to_continue and continue_on_error?(e)
        return true
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
      {:sample_rate => sample_rate, :channels => channels}.merge(additional_parameters)
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
