require 'rubygems'
require 'ffi'

include FFI

def try_to(message, &block)
  puts message
  if (err = yield) < 0
    raise "cannot #{message} (#{ALSA::strerror(err)})"
  end
end

module ALSA
  extend FFI::Library
  ffi_lib "libasound.so"

  attach_function :strerror, :snd_strerror, [:int], :string

  module PCM
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

module Sndfile
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
      alsa_device = "hw:0"
      capture_handle = MemoryPointer.new :pointer
      hw_params = MemoryPointer.new :pointer
      format = ALSA::PCM::FORMAT_S16_LE
      sample_rate = 44100

      try_to "open audio device #{alsa_device}" do
        ALSA::PCM::open capture_handle, alsa_device, ALSA::PCM::STREAM_CAPTURE, ALSA::PCM::BLOCK
      end

      capture_handle = capture_handle.read_pointer

      try_to "allocate hardware parameter structure" do
        ALSA::PCM::hw_params_malloc hw_params
      end

      hw_params = hw_params.read_pointer

      try_to "initialize hardware parameter structure" do
        ALSA::PCM::hw_params_any capture_handle, hw_params
      end

      try_to "set access type" do
        ALSA::PCM::hw_params_set_access capture_handle, hw_params, ALSA::PCM::ACCESS_RW_INTERLEAVED
      end

      try_to "set sample format" do
        ALSA::PCM::hw_params_set_format capture_handle, hw_params, format
      end

      try_to "set sample rate" do
        rate = MemoryPointer.new(:int)
        rate.write_int(sample_rate)

        dir = MemoryPointer.new(:int)
        dir.write_int(0)

        ALSA::PCM::hw_params_set_rate_near capture_handle, hw_params, rate, dir
      end

      try_to "set channel count" do
        ALSA::PCM::hw_params_set_channels capture_handle, hw_params, 2
      end

      try_to "set hw parameters" do
        ALSA::PCM::hw_params capture_handle, hw_params
      end

      try_to "unallocate hw_params" do
        ALSA::PCM::hw_params_free hw_params
      end

      try_to "prepare audio interface to use" do
        ALSA::PCM::prepare capture_handle
      end

      frame_count = sample_rate
      buffer = MemoryPointer.new(ALSA::PCM::format_size(format, frame_count) * 2)

      info = Sndfile::Native::Info.new
      info[:samplerate] = sample_rate
      info[:channels] = 2
      info[:format] = (Sndfile::Native::Format::WAV | Sndfile::Native::Format::PCM_16)

      file = Sndfile::Native::open "tmp/test.wav", Sndfile::Native::MODE_WRITE, info
      if file.is_a?(FFI::NullPointer)
        raise "Not able to open output file " + Sndfile::Native::strerror(file)
      end

      2.times do 
        try_to "read from audio interface" do
          read_size = ALSA::PCM::readi(capture_handle, buffer, frame_count)
          if read_size != frame_count
            raise "can't read expected frame count (#{read_size}/#{frame_count})"
          else
            # returns value is an error code
            read_size
          end
        end

        unless Sndfile::Native::write_int(file, buffer, frame_count) == frame_count
          raise Sndfile::Native::strerror file
        end
      end

      Sndfile::Native::close file

      try_to "close audio device" do
        ALSA::PCM::close capture_handle
      end
    end
    
  end
end
