require 'alsa'
require 'sndfile'

module AlsaBackup
  class Recorder

    def start
      format = {:sample_rate => 44100, :channels => 2}

      Sndfile::File.open("tmp/test.wav", "w", format.merge(:format => "wav pcm_16")) do |file|
        ALSA::PCM::Capture.new.open("hw:0") do |capture|
          capture.hardware_parameters = format.merge(:sample_format => :s16_le)

          frames_to_read = format[:sample_rate] * 2
          capture.read do |buffer, frame_count|
            file.write buffer, frame_count
            (frames_to_read -= frame_count) > 0
          end
        end
      end
    end
    
  end
end
