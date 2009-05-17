require 'alsa'
require 'sndfile'

module AlsaBackup
  class Recorder

    def start
      format = {:sample_rate => 44100, :channels => 2}

      Sndfile::File.open("tmp/test.wav", "w", format.with(:format => "wav pcm_16")) do |file|
        ALSA::PCM::Capture.open("hw:0", format.with(:sample_format => :s16_le)) do |capture|
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
