#!/usr/bin/env ruby

# Make sine wav file
# using sndfile via ruby-ffi
#
# Based on sndfile example 

require 'rubygems'
require 'ffi'

include FFI

module Sndfile
  module Native
    extend FFI::Library
    ffi_lib "libsndfile.so"

    module Format
      WAV = 0x010000
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

sample_rate = 44100

info = Sndfile::Native::Info.new
info[:samplerate] = sample_rate
info[:channels] = 1
info[:format] = (Sndfile::Native::Format::WAV | Sndfile::Native::Format::PCM_24)

file = Sndfile::Native::open "sine.wav", Sndfile::Native::MODE_WRITE, info
if file.is_a?(FFI::NullPointer)
  raise "Not able to open output file " + Sndfile::Native::strerror(file)
end

frame_count = sample_rate * 4
sine = (0...frame_count).collect do |frame|
  0x7F000000 * Math.sin(2 * Math::PI * 440 * frame / sample_rate)
end

buffer = MemoryPointer.new(:int, frame_count)
buffer.write_array_of_int sine

unless Sndfile::Native::write_int(file, buffer, frame_count) == frame_count
  raise Sndfile::Native::strerror file
end

Sndfile::Native::close file
