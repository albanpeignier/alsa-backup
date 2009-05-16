require 'rubygems'
require 'ffi'

include FFI

def try_to(message, &block)
  puts message
  if (response = yield) < 0
    raise "cannot #{message} (#{ALSA::Native::strerror(err)})"
  else
    response
  end
end

module ALSA
  module Native
    extend FFI::Library
    ffi_lib "libasound.so"

    attach_function :strerror, :snd_strerror, [:int], :string
  end

  module PCM

    class Capture

      attr_accessor :handle

      def open(device)
        capture_handle = MemoryPointer.new :pointer
        try_to "open audio device #{device}" do
          ALSA::PCM::Native::open capture_handle, device, ALSA::PCM::Native::STREAM_CAPTURE, ALSA::PCM::Native::BLOCK
        end
        self.handle = capture_handle.read_pointer

        if block_given?
          begin
            yield self 
          ensure
            self.close
          end
        end
      end

      def change_hardware_parameters
        hw_params = HwPameters.new(self)
        begin
          yield hw_params
          self.hardware_parameters = hw_params
        ensure
          hw_params.free
        end
      end

      def hardware_parameters=(hw_params)
        try_to "set hw parameters" do
          ALSA::PCM::Native::hw_params self.handle, hw_params.handle
        end
      end

      def read
        # TODO use real data to calculate buffer size
        frame_count = 44100
        format = ALSA::PCM::Native::FORMAT_S16_LE
        
        buffer = MemoryPointer.new(ALSA::PCM::Native::format_size(format, frame_count) * 2)

        continue = true
        while continue
          read_count = try_to "read from audio interface" do
            ALSA::PCM::Native::readi(self.handle, buffer, frame_count)
          end

          raise "can't read expected frame count (#{read_count}/#{frame_count})" unless read_count == frame_count
          
          continue = yield buffer, read_count
        end

        buffer.free
      end

      def close
        try_to "close audio device" do
          ALSA::PCM::Native::close self.handle
        end
      end

      class HwPameters

        attr_accessor :handle, :device

        def initialize(device = nil)
          hw_params_pointer = MemoryPointer.new :pointer
          ALSA::PCM::Native::hw_params_malloc hw_params_pointer        
          self.handle = hw_params_pointer.read_pointer

          self.device = device if device
        end

        def device=(device)
          try_to "initialize hardware parameter structure" do
            ALSA::PCM::Native::hw_params_any device.handle, self.handle
          end
          @device = device
        end

        def access=(access)
          try_to "set access type" do
            ALSA::PCM::Native::hw_params_set_access self.device.handle, self.handle, access
          end
        end

        def channels=(channels)
          try_to "set channel count : #{channels}" do
            ALSA::PCM::Native::hw_params_set_channels self.device.handle, self.handle, channels
          end
        end

        def sample_rate=(sample_rate)
          try_to "set sample rate" do
            rate = MemoryPointer.new(:int)
            rate.write_int(sample_rate)

            dir = MemoryPointer.new(:int)
            dir.write_int(0)

            error_code = ALSA::PCM::Native::hw_params_set_rate_near self.device.handle, self.handle, rate, dir

            rate.free
            dir.free

            error_code
          end
        end

        def sample_format=(sample_format)
          try_to "set sample format" do
            ALSA::PCM::Native::hw_params_set_format self.device.handle, self.handle, sample_format
          end
        end

        def free
          try_to "unallocate hw_params" do
            ALSA::PCM::Native::hw_params_free self.handle
          end
        end

      end

    end

    module Native
      extend FFI::Library
      ffi_lib "libasound.so"

      STREAM_CAPTURE = 1
      BLOCK = 0
      attach_function :open, :snd_pcm_open, [:pointer, :string, :int, :int], :int
      attach_function :prepare, :snd_pcm_prepare, [ :pointer ], :int
      attach_function :close, :snd_pcm_close, [:pointer], :int

      attach_function :readi, :snd_pcm_readi, [ :pointer, :pointer, :ulong ], :long

      attach_function :hw_params_malloc, :snd_pcm_hw_params_malloc, [:pointer], :int
      attach_function :hw_params_free, :snd_pcm_hw_params_free, [:pointer], :int

      attach_function :hw_params, :snd_pcm_hw_params, [ :pointer, :pointer ], :int
      attach_function :hw_params_any, :snd_pcm_hw_params_any, [:pointer, :pointer], :int

      ACCESS_RW_INTERLEAVED = 3
      attach_function :hw_params_set_access, :snd_pcm_hw_params_set_access, [ :pointer, :pointer, :int ], :int

      FORMAT_S16_LE = 2
      attach_function :hw_params_set_format, :snd_pcm_hw_params_set_format, [ :pointer, :pointer, :int ], :int
      attach_function :hw_params_set_rate_near, :snd_pcm_hw_params_set_rate_near, [ :pointer, :pointer, :pointer, :pointer ], :int
      attach_function :hw_params_set_channels, :snd_pcm_hw_params_set_channels, [ :pointer, :pointer, :uint ], :int
      attach_function :hw_params_set_periods, :snd_pcm_hw_params_set_periods, [ :pointer, :pointer, :uint, :int ], :int

      attach_function :format_size, :snd_pcm_format_size, [ :int, :uint ], :int
    end
  end
end

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
            hw_params.sample_format = ALSA::PCM::Native::FORMAT_S16_LE
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
