require 'sndfile'
require 'fileutils'

module AlsaBackup
  class Writer

    attr_accessor :directory, :file, :format

    def self.default_format
      {:sample_rate => 44100, :channels => 2, :format => "wav pcm_16"}
    end

    def initialize(directory, file, format = Writer.default_format)
      @directory = directory
      @file = file
      @format = format
    end

    def self.open(directory, file, format, &block)
      writer = Writer.new(directory, file, format).prepare

      begin
        yield writer
      ensure
        writer.close
      end
    end

    def prepare
      # prepare sndfile
      self.sndfile
      self
    end

    def write(*arguments)
      self.sndfile.write *arguments
    end

    def close
      if @sndfile
        AlsaBackup.logger.info('close current file')
        @sndfile.close 
      end
      @sndfile = nil
    end

    def file
      case @file
      when Proc
        @file.call
      else
        @file
      end
    end

    def target_file
      File.join self.directory, self.file
    end

    def sndfile
      target_file = self.target_file
      raise "no recording file" unless target_file

      unless @sndfile and @sndfile.path == target_file
        @sndfile.close if @sndfile

        Writer.rename_existing_file(target_file)
        AlsaBackup.logger.info{"new file #{File.expand_path target_file}"}

        FileUtils.mkdir_p File.dirname(target_file)
        @sndfile = Sndfile::File.new(target_file, "w", self.format)
      end
      @sndfile
    end

    def self.rename_existing_file(file)
      if File.exists?(file)
        index = 1

        while File.exists?(new_file = File.suffix_basename(file, "-#{index}"))
          index += 1

          raise "can't find a free file for #{file}" if index > 1000
        end

        AlsaBackup.logger.warn "rename existing file #{File.basename(file)} into #{new_file}"
        File.rename(file, new_file)
      end
    end

  end
end
