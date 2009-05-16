require 'rubygems'
require 'ffi'

module Sndfile

  class File

    def self.open(path, mode, info)
      file = self.new(path, mode, info)

      begin
        yield file
      ensure
        file.close
      end
    end

    def initialize(path, mode, info)
      info = (Hash === info ? Info.new(info) : info)
      @handle = Sndfile::Native::open path, File.native_mode(mode), info.to_native
      if @handle.is_a?(FFI::NullPointer)
        raise "Not able to open output file " + self.error
      end
    end

    def write(buffer, frame_count)
      unless Sndfile::Native::write_int(@handle, buffer, frame_count) == frame_count
        raise self.error
      end
    end

    def close
      Sndfile::Native::close @handle
    end

    def error
      Sndfile::Native::strerror @handle
    end

    def self.native_mode(mode)
      case mode 
      when "w": Sndfile::Native::MODE_WRITE
      else
        raise "Unknown mode: #{mode}"
      end
    end

  end

  class Info

    attr_accessor :sample_rate, :channels, :format

    def initialize(attributes = {})
      attributes.each_pair { |name, value| send("#{name}=", value) }
    end

    def to_native
      Sndfile::Native::Info.new.tap do |native|
        native[:samplerate] = self.sample_rate
        native[:channels] = self.channels
        native[:format] = self.native_format
      end
    end

    def format=(format)
      @format = Info.normalized_format(format)
    end

    def native_format
      self.format.inject(0) do |native_format, format_part|
        native_format | Sndfile::Native::Format.const_get(format_part.upcase)
      end
    end

    def self.normalized_format(format)
      Array(format).join(' ').downcase.scan(/[a-z0-9_]+/)      
    end

  end

  module Native
    extend FFI::Library
    ffi_lib "libsndfile.so"

    module Format
      WAV = 0x010000
      PCM_16 = 0x0002
      PCM_24 = 0x0003
    end

    MODE_READ = 0x10
    MODE_WRITE = 0x20
    MODE_RDWR = 0x30

    class Info < FFI::Struct
      layout(
             :frames, :int64,
             :samplerate, :int,
             :channels, :int,
             :format, :int,
             :sections, :int,
             :seekable, :int
             )
    end

    attach_function :open, :sf_open, [ :string, :int, :pointer ], :pointer
    attach_function :close, :sf_close, [ :pointer ], :int

    attach_function :write_int, :sf_write_int, [ :pointer, :pointer, :int ], :int

    attach_function :strerror, :sf_strerror, [ :pointer ], :string
  end
end
