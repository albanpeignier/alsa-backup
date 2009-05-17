require 'alsa'
require 'sndfile'

module AlsaBackup
  class Recorder

    def initialize(file = nil)
      @file = file
    end

    attr_accessor :file

    def start
      # prepare sndfile
      self.sndfile

      ALSA::PCM::Capture.open("hw:0", self.format(:sample_format => :s16_le)) do |capture|
        frames_to_record = format[:sample_rate] * 2

        capture.read do |buffer, frame_count|
          self.sndfile.write buffer, frame_count
          (frames_to_record -= frame_count) > 0
        end
      end
    ensure
      @sndfile.close if @sndfile
    end

    def file
      case @file
      when Proc
        @file.call
      else
        @file
      end
    end

    def format(additional_parameters = {})
      {:sample_rate => 44100, :channels => 2}.merge(additional_parameters)
    end

    def sndfile
      target_file = self.file
      raise "no recording file" unless target_file

      unless @sndfile and @sndfile.path == target_file
        @sndfile.close if @sndfile
        puts "open sndfile #{target_file}"
        @sndfile = Sndfile::File.new(target_file, "w", self.format(:format => "wav pcm_16"))
      end
      @sndfile
    end
    
  end
end
