require 'ffi'

require 'logger'

module ALSA

  def self.logger
    unless @logger
      @logger = Logger.new(STDERR)
      @logger.level = Logger::WARN
    end

    @logger
  end

  def self.logger=(logger); @logger = logger; end

  def self.try_to(message, &block)
    logger.debug { message }
    if ALSA::Native::error_code?(response = yield)
      raise "cannot #{message} (#{ALSA::Native::strerror(response)})"
    else
      response
    end
  end

  module Native
    extend FFI::Library
    ffi_lib "libasound.so"

    attach_function :strerror, :snd_strerror, [:int], :string

    def self.error_code?(response)
      response < 0
    end
  end

  module PCM

    class Capture

      attr_accessor :handle

      def self.open(device, hardware_attributes = {}, &block)
        Capture.new.open(device, hardware_attributes, &block)
      end

      def open(device, hardware_attributes = {}, &block)
        capture_handle = FFI::MemoryPointer.new :pointer
        ALSA::try_to "open audio device #{device}" do
          ALSA::PCM::Native::open capture_handle, device, ALSA::PCM::Native::STREAM_CAPTURE, ALSA::PCM::Native::BLOCK
        end
        self.handle = capture_handle.read_pointer

        self.hardware_parameters=hardware_attributes

        if block_given?
          begin
            yield self 
          ensure
            self.close
          end
        end
      end

      def change_hardware_parameters
        hw_params = HwParameters.new(self).default_for_device

        begin
          yield hw_params

          ALSA::try_to "set hw parameters" do
            ALSA::PCM::Native::hw_params self.handle, hw_params.handle
          end
        ensure
          hw_params.free
        end
      end

      def hardware_parameters
        HwParameters.new(self).current_for_device
      end
      alias_method :hw_params, :hardware_parameters

      def hardware_parameters=(attributes= {})
        attributes = {:access => :rw_interleaved}.update(attributes)
        change_hardware_parameters do |hw_params|
          hw_params.update_attributes(attributes)
        end
      end

      def read
        ALSA.logger.debug { "start read with #{hw_params.sample_rate}, #{hw_params.channels} channels"}

        # use an 500ms buffer
        frame_count = hw_params.sample_rate / 2
        ALSA.logger.debug { "allocate #{hw_params.buffer_size_for(frame_count)} bytes for #{frame_count} frames" }
        FFI::MemoryPointer.new(:char, hw_params.buffer_size_for(frame_count)) do |buffer|
          begin
            read_buffer buffer, frame_count
          end while yield buffer, frame_count
        end
      end

      def read_buffer(buffer, frame_count)
        read_count = ALSA::try_to "read from audio interface" do
          response = ALSA::PCM::Native::readi(self.handle, buffer, frame_count)
          if ALSA::Native::error_code?(response)
            ALSA.logger.warn { "try to recover '#{ALSA::Native::strerror(response)}' on read"}
            ALSA::PCM::Native::pcm_recover(self.handle, response, 1)
          else
            response
          end
        end

        missing_frame_count = frame_count - read_count
        if missing_frame_count > 0
          ALSA.logger.debug { "re-read missing frame count: #{missing_frame_count}"}
          read_buffer_size = hw_params.buffer_size_for(read_count)
          # buffer[read_buffer_size] doesn't return a MemoryPointer
          read_buffer(buffer + read_buffer_size, missing_frame_count)
        end
      end

      def close
        ALSA::try_to "close audio device" do
          ALSA::PCM::Native::close self.handle
        end
      end

      class HwParameters

        attr_accessor :handle, :device

        def initialize(device = nil)
          hw_params_pointer = FFI::MemoryPointer.new :pointer

          ALSA::PCM::Native::hw_params_malloc hw_params_pointer        
          self.handle = hw_params_pointer.read_pointer

          self.device = device if device
        end

        def update_attributes(attributes)
          attributes.each_pair { |name, value| send("#{name}=", value) }
        end

        def default_for_device
          ALSA::try_to "initialize hardware parameter structure" do
            ALSA::PCM::Native::hw_params_any device.handle, self.handle
          end
          self
        end

        def current_for_device
          ALSA::try_to "retrieve current hardware parameters" do
            ALSA::PCM::Native::hw_params_current device.handle, self.handle
          end
          self
        end

        def access=(access)
          ALSA::try_to "set access type" do
            ALSA::PCM::Native::hw_params_set_access self.device.handle, self.handle, ALSA::PCM::Native::Access.const_get(access.to_s.upcase)
          end
        end

        def channels=(channels)
          ALSA::try_to "set channel count : #{channels}" do
            ALSA::PCM::Native::hw_params_set_channels self.device.handle, self.handle, channels
          end
        end

        def sample_rate=(sample_rate)
          ALSA::try_to "set sample rate" do
            rate = FFI::MemoryPointer.new(:int)
            rate.write_int(sample_rate)

            dir = FFI::MemoryPointer.new(:int)
            dir.write_int(0)

            error_code = ALSA::PCM::Native::hw_params_set_rate_near self.device.handle, self.handle, rate, dir

            rate.free
            dir.free

            error_code
          end
        end

        def sample_rate
          rate = nil
          ALSA::try_to "get sample rate" do
            rate_pointer = FFI::MemoryPointer.new(:int)
            dir_pointer = FFI::MemoryPointer.new(:int)
            dir_pointer.write_int(0)

            error_code = ALSA::PCM::Native::hw_params_get_rate self.handle, rate_pointer, dir_pointer

            rate = rate_pointer.read_int

            rate_pointer.free
            dir_pointer.free

            error_code
          end
          rate
        end

        def sample_format=(sample_format)
          ALSA::try_to "set sample format" do
            ALSA::PCM::Native::hw_params_set_format self.device.handle, self.handle, ALSA::PCM::Native::Format.const_get(sample_format.to_s.upcase)
          end
        end

        def sample_format
          format = nil
          FFI::MemoryPointer.new(:int) do |format_pointer|
            ALSA::try_to "get sample format" do
              ALSA::PCM::Native::hw_params_get_format self.handle, format_pointer
            end
            format = format_pointer.read_int
          end
          format
        end

        def channels
          channels = nil
          FFI::MemoryPointer.new(:int) do |channels_pointer|
            ALSA::try_to "get channels" do
              ALSA::PCM::Native::hw_params_get_channels self.handle, channels_pointer
            end
            channels = channels_pointer.read_int
          end
          channels
        end

        def buffer_size_for(frame_count)
          ALSA::PCM::Native::format_size(self.sample_format, frame_count) * self.channels
        end

        def free
          ALSA::try_to "unallocate hw_params" do
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

      attach_function :pcm_recover, :snd_pcm_recover, [ :pointer, :int, :int ], :int

      attach_function :hw_params_malloc, :snd_pcm_hw_params_malloc, [:pointer], :int
      attach_function :hw_params_free, :snd_pcm_hw_params_free, [:pointer], :int

      attach_function :hw_params, :snd_pcm_hw_params, [ :pointer, :pointer ], :int
      attach_function :hw_params_any, :snd_pcm_hw_params_any, [:pointer, :pointer], :int
      attach_function :hw_params_current, :snd_pcm_hw_params_current, [ :pointer, :pointer ], :int


      module Access
        MMAP_INTERLEAVED = 0
        MMAP_NONINTERLEAVED = 1
        MMAP_COMPLEX = 2
        RW_INTERLEAVED = 3
        RW_NONINTERLEAVED = 4
      end

      attach_function :hw_params_set_access, :snd_pcm_hw_params_set_access, [ :pointer, :pointer, :int ], :int

      module Format
        S16_LE = 2
      end
      
      attach_function :hw_params_set_format, :snd_pcm_hw_params_set_format, [ :pointer, :pointer, :int ], :int
      attach_function :hw_params_get_format, :snd_pcm_hw_params_get_format, [ :pointer, :pointer ], :int
      attach_function :hw_params_get_rate, :snd_pcm_hw_params_get_rate, [ :pointer, :pointer, :pointer ], :int
      attach_function :hw_params_set_rate_near, :snd_pcm_hw_params_set_rate_near, [ :pointer, :pointer, :pointer, :pointer ], :int
      attach_function :hw_params_set_channels, :snd_pcm_hw_params_set_channels, [ :pointer, :pointer, :uint ], :int
      attach_function :hw_params_get_channels, :snd_pcm_hw_params_get_format, [ :pointer, :pointer ], :int
      attach_function :hw_params_set_periods, :snd_pcm_hw_params_set_periods, [ :pointer, :pointer, :uint, :int ], :int

      attach_function :format_size, :snd_pcm_format_size, [ :int, :uint ], :int
    end
  end
end
