require 'alsa'

module AlsaBackup
  class Recorder

    def initialize(file = "record.wav")
      @file = File.basename(file)
      @directory = File.dirname(file)
    end

    attr_accessor :file, :directory

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
    rescue Exception => e
      AlsaBackup.logger.error(e)
      AlsaBackup.logger.error(e.backtrace.join("\n"))
      raise e
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
