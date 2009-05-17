require 'alsa'
require 'sndfile'

module AlsaBackup
  class Recorder

    def start
      sample_rate = 44100

      Sndfile::File.open("tmp/test.wav", "w", :sample_rate => 44100, :channels => 2, :format => "wav pcm_16") do |file|
        ALSA::PCM::Capture.new.open("hw:0") do |capture|
          capture.change_hardware_parameters do |hw_params|
            hw_params.access = ALSA::PCM::Native::ACCESS_RW_INTERLEAVED
            hw_params.sample_rate = 44100
            hw_params.channels = 2
            hw_params.sample_format = ALSA::PCM::Native::Format::S16_LE
          end

          start = Time.now
          capture.read do |buffer, frame_count|
            file.write buffer, frame_count
            (Time.now - start) < 2
          end
        end
      end
    end
    
  end
end
