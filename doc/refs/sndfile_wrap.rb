  SF_ENDIAN_FILE = 0x00000000
  SF_FORMAT_SUBMASK = 0x0000FFFF
  SF_FORMAT_PCM_S8 = 0x0001
  SF_FORMAT_PCM_16 = 0x0002
  SF_FORMAT_PCM_24 = 0x0003
  SF_FORMAT_PCM_32 = 0x0004
  SF_FORMAT_PCM_U8 = 0x0005
  SF_FORMAT_FLOAT = 0x0006
  SF_FORMAT_DOUBLE = 0x0007
  SF_FORMAT_ULAW = 0x0010
  SF_FORMAT_ALAW = 0x0011
  SF_FORMAT_IMA_ADPCM = 0x0012
  SF_FORMAT_MS_ADPCM = 0x0013
  SF_FORMAT_GSM610 = 0x0020
  SF_FORMAT_VOX_ADPCM = 0x0021
  SF_FORMAT_G721_32 = 0x0030
  SF_FORMAT_G723_24 = 0x0031
  SF_FORMAT_G723_40 = 0x0032
  SF_FORMAT_DWVW_12 = 0x0040
  SF_FORMAT_DWVW_16 = 0x0041
  SF_FORMAT_DWVW_24 = 0x0042
  SF_FORMAT_DWVW_N = 0x0043
  SF_FORMAT_DPCM_8 = 0x0050
  SF_FORMAT_DPCM_16 = 0x0051
  SF_FORMAT_VORBIS = 0x0060
  SF_FORMAT_WAV = 0x010000
  SF_FORMAT_AIFF = 0x020000
  SF_FORMAT_AU = 0x030000
  SF_FORMAT_RAW = 0x040000
  SF_FORMAT_PAF = 0x050000
  SF_FORMAT_SVX = 0x060000
  SF_FORMAT_NIST = 0x070000
  SF_FORMAT_VOC = 0x080000
  SF_FORMAT_IRCAM = 0x0A0000
  SF_FORMAT_W64 = 0x0B0000
  SF_FORMAT_MAT4 = 0x0C0000
  SF_FORMAT_MAT5 = 0x0D0000
  SF_FORMAT_PVF = 0x0E0000
  SF_FORMAT_XI = 0x0F0000
  SF_FORMAT_TYPEMASK = 0x0FFF0000
  SF_FORMAT_HTK = 0x100000
  SF_ENDIAN_LITTLE = 0x10000000
  SF_FORMAT_SDS = 0x110000
  SF_FORMAT_AVR = 0x120000
  SF_FORMAT_WAVEX = 0x130000
  SF_FORMAT_SD2 = 0x160000
  SF_FORMAT_FLAC = 0x170000
  SF_FORMAT_CAF = 0x180000
  SF_FORMAT_WVE = 0x190000
  SF_FORMAT_OGG = 0x200000
  SF_ENDIAN_BIG = 0x20000000
  SF_FORMAT_MPC2K = 0x210000
  SF_FORMAT_RF64 = 0x220000
  SF_ENDIAN_CPU = 0x30000000
  SF_FORMAT_ENDMASK = 0x30000000

  SFC_GET_LIB_VERSION = 0x1000
  SFC_GET_LOG_INFO = 0x1001
  SFC_GET_CURRENT_SF_INFO = 0x1002
  SFC_GET_NORM_DOUBLE = 0x1010
  SFC_GET_NORM_FLOAT = 0x1011
  SFC_SET_NORM_DOUBLE = 0x1012
  SFC_SET_NORM_FLOAT = 0x1013
  SFC_SET_SCALE_FLOAT_INT_READ = 0x1014
  SFC_SET_SCALE_INT_FLOAT_WRITE = 0x1015
  SFC_GET_SIMPLE_FORMAT_COUNT = 0x1020
  SFC_GET_SIMPLE_FORMAT = 0x1021
  SFC_GET_FORMAT_INFO = 0x1028
  SFC_GET_FORMAT_MAJOR_COUNT = 0x1030
  SFC_GET_FORMAT_MAJOR = 0x1031
  SFC_GET_FORMAT_SUBTYPE_COUNT = 0x1032
  SFC_GET_FORMAT_SUBTYPE = 0x1033
  SFC_CALC_SIGNAL_MAX = 0x1040
  SFC_CALC_NORM_SIGNAL_MAX = 0x1041
  SFC_CALC_MAX_ALL_CHANNELS = 0x1042
  SFC_CALC_NORM_MAX_ALL_CHANNELS = 0x1043
  SFC_GET_SIGNAL_MAX = 0x1044
  SFC_GET_MAX_ALL_CHANNELS = 0x1045
  SFC_SET_ADD_PEAK_CHUNK = 0x1050
  SFC_SET_ADD_HEADER_PAD_CHUNK = 0x1051
  SFC_UPDATE_HEADER_NOW = 0x1060
  SFC_SET_UPDATE_HEADER_AUTO = 0x1061
  SFC_SET_ADD_DITHER_ON_WRITE = 0x1070
  SFC_SET_ADD_DITHER_ON_READ = 0x1071
  SFC_FILE_TRUNCATE = 0x1080
  SFC_SET_RAW_START_OFFSET = 0x1090
  SFC_SET_DITHER_ON_WRITE = 0x10A0
  SFC_SET_DITHER_ON_READ = 0x10A1
  SFC_GET_DITHER_INFO_COUNT = 0x10A2
  SFC_GET_DITHER_INFO = 0x10A3
  SFC_GET_EMBED_FILE_INFO = 0x10B0
  SFC_SET_CLIPPING = 0x10C0
  SFC_GET_CLIPPING = 0x10C1
  SFC_GET_INSTRUMENT = 0x10D0
  SFC_SET_INSTRUMENT = 0x10D1
  SFC_GET_LOOP_INFO = 0x10E0
  SFC_GET_BROADCAST_INFO = 0x10F0
  SFC_SET_BROADCAST_INFO = 0x10F1
  SFC_GET_CHANNEL_MAP_INFO = 0x1100
  SFC_SET_CHANNEL_MAP_INFO = 0x1101
  SFC_RAW_DATA_NEEDS_ENDSWAP = 0x1110
  SFC_WAVEX_SET_AMBISONIC = 0x1200
  SFC_WAVEX_GET_AMBISONIC = 0x1201
  SFC_SET_VBR_ENCODING_QUALITY = 0x1300
  SFC_TEST_IEEE_FLOAT_REPLACE = 0x6001

  SF_STR_TITLE = 0x01
  SF_STR_COPYRIGHT = 0x02
  SF_STR_SOFTWARE = 0x03
  SF_STR_ARTIST = 0x04
  SF_STR_COMMENT = 0x05
  SF_STR_DATE = 0x06
  SF_STR_ALBUM = 0x07
  SF_STR_LICENSE = 0x08

  SF_FALSE = 0
  SFM_READ = 0x10
  SFM_WRITE = 0x20
  SFM_RDWR = 0x30
  SF_AMBISONIC_NONE = 0x40
  SF_AMBISONIC_B_FORMAT = 0x41
  SF_TRUE = 1

  SF_ERR_NO_ERROR = 0
  SF_ERR_UNRECOGNISED_FORMAT = 1
  SF_ERR_SYSTEM = 2
  SF_ERR_MALFORMED_FILE = 3
  SF_ERR_UNSUPPORTED_ENCODING = 4

  SF_CHANNEL_MAP_INVALID = 0
  SF_CHANNEL_MAP_MONO = 1
  SF_CHANNEL_MAP_REAR_RIGHT = 10
  SF_CHANNEL_MAP_LFE = 11
  SF_CHANNEL_MAP_FRONT_LEFT_OF_CENTER = 12
  SF_CHANNEL_MAP_FRONT_RIGHT_OF_CENTER = 13
  SF_CHANNEL_MAP_SIDE_LEFT = 14
  SF_CHANNEL_MAP_SIDE_RIGHT = 15
  SF_CHANNEL_MAP_TOP_CENTER = 16
  SF_CHANNEL_MAP_TOP_FRONT_LEFT = 17
  SF_CHANNEL_MAP_TOP_FRONT_RIGHT = 18
  SF_CHANNEL_MAP_TOP_FRONT_CENTER = 19
  SF_CHANNEL_MAP_LEFT = 2
  SF_CHANNEL_MAP_TOP_REAR_LEFT = 20
  SF_CHANNEL_MAP_TOP_REAR_RIGHT = 21
  SF_CHANNEL_MAP_TOP_REAR_CENTER = 22
  SF_CHANNEL_MAP_RIGHT = 3
  SF_CHANNEL_MAP_CENTER = 4
  SF_CHANNEL_MAP_FRONT_LEFT = 5
  SF_CHANNEL_MAP_FRONT_RIGHT = 6
  SF_CHANNEL_MAP_FRONT_CENTER = 7
  SF_CHANNEL_MAP_REAR_CENTER = 8
  SF_CHANNEL_MAP_REAR_LEFT = 9

  SF_COUNT_MAX = 0x7FFFFFFFFFFFFFFFLL
  class SFINFO < FFI::Struct
    layout(
           :frames, off_t,
           :samplerate, :int,
           :channels, :int,
           :format, :int,
           :sections, :int,
           :seekable, :int
    )
  end
  class SFFORMATINFO < FFI::Struct
    layout(
           :format, :int,
           :name, :pointer,
           :extension, :pointer
    )
    def name=(str)
      @name = FFI::MemoryPointer.from_string(str)
      self[:name] = @name
    end
    def name
      @name.get_string(0)
    end
    def extension=(str)
      @extension = FFI::MemoryPointer.from_string(str)
      self[:extension] = @extension
    end
    def extension
      @extension.get_string(0)
    end

  end
  SFD_DEFAULT_LEVEL = 0
  SFD_CUSTOM_LEVEL = 0x40000000
  SFD_NO_DITHER = 500
  SFD_WHITE = 501
  SFD_TRIANGULAR_PDF = 502

  class SFDITHERINFO < FFI::Struct
    layout(
           :type, :int,
           :level, :double,
           :name, :pointer
    )
    def name=(str)
      @name = FFI::MemoryPointer.from_string(str)
      self[:name] = @name
    end
    def name
      @name.get_string(0)
    end

  end
  class SFEMBEDFILEINFO < FFI::Struct
    layout(
           :offset, off_t,
           :length, off_t
    )
  end
  SF_LOOP_NONE = 800
  SF_LOOP_FORWARD = 801
  SF_LOOP_BACKWARD = 802
  SF_LOOP_ALTERNATING = 803

  class SFINSTRUMENT < FFI::Struct
    layout(
           :gain, :int,
           :basenote, :char,
           :detune, :char,
           :velocity_lo, :char,
           :velocity_hi, :char,
           :key_lo, :char,
           :key_hi, :char,
           :loop_count, :int,
           :loops, [SFINSTRUMENTLoops, 16]
    )
  end
  class SFINSTRUMENTLoops < FFI::Struct
    layout(
           :mode, :int,
           :start, :uint,
           :end, :uint,
           :count, :uint
    )
  end
  class SFLOOPINFO < FFI::Struct
    layout(
           :time_sig_num, :short,
           :time_sig_den, :short,
           :loop_mode, :int,
           :num_beats, :int,
           :bpm, :float,
           :root_key, :int,
           :future, [:int, 6]
    )
  end
  class SFBROADCASTINFO < FFI::Struct
    layout(
           :description, [:char, 256],
           :originator, [:char, 32],
           :originator_reference, [:char, 32],
           :origination_date, [:char, 10],
           :origination_time, [:char, 8],
           :time_reference_low, :uint,
           :time_reference_high, :uint,
           :version, :short,
           :umid, [:char, 64],
           :reserved, [:char, 190],
           :coding_history_size, :uint,
           :coding_history, [:char, 256]
    )
  end
  callback(:sf_vio_get_filelen, [ :pointer ], sf)
  callback(:sf_vio_seek, [ off_t, :int, :pointer ], sf)
  callback(:sf_vio_read, [ :pointer, off_t, :pointer ], sf)
  callback(:sf_vio_write, [ :pointer, off_t, :pointer ], sf)
  callback(:sf_vio_tell, [ :pointer ], sf)
  class SFVIRTUALIO < FFI::Struct
    layout(
           :get_filelen, :sf_vio_get_filelen,
           :seek, :sf_vio_seek,
           :read, :sf_vio_read,
           :write, :sf_vio_write,
           :tell, :sf_vio_tell
    )
    def get_filelen=(cb)
      @get_filelen = cb
      self[:get_filelen] = @get_filelen
    end
    def get_filelen
      @get_filelen
    end
    def seek=(cb)
      @seek = cb
      self[:seek] = @seek
    end
    def seek
      @seek
    end
    def read=(cb)
      @read = cb
      self[:read] = @read
    end
    def read
      @read
    end
    def write=(cb)
      @write = cb
      self[:write] = @write
    end
    def write
      @write
    end
    def tell=(cb)
      @tell = cb
      self[:tell] = @tell
    end
    def tell
      @tell
    end

  end
  attach_function :sf_open, [ :string, :int, :pointer ], :pointer
  attach_function :sf_open_fd, [ :int, :int, :pointer, :int ], :pointer
  attach_function :sf_open_virtual, [ :pointer, :int, :pointer, :pointer ], :pointer
  attach_function :sf_error, [ :pointer ], :int
  attach_function :sf_strerror, [ :pointer ], :string
  attach_function :sf_error_number, [ :int ], :string
  attach_function :sf_perror, [ :pointer ], :int
  attach_function :sf_error_str, [ :pointer, :string, :uint ], :int
  attach_function :sf_command, [ :pointer, :int, :pointer, :int ], :int
  attach_function :sf_format_check, [ :pointer ], :int
  attach_function :sf_seek, [ :pointer, off_t, :int ], off_t
  attach_function :sf_set_string, [ :pointer, :int, :string ], :int
  attach_function :sf_get_string, [ :pointer, :int ], :string
  attach_function :sf_read_raw, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_write_raw, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_readf_short, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_writef_short, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_readf_int, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_writef_int, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_readf_float, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_writef_float, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_readf_double, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_writef_double, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_read_short, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_write_short, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_read_int, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_write_int, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_read_float, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_write_float, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_read_double, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_write_double, [ :pointer, :pointer, off_t ], off_t
  attach_function :sf_close, [ :pointer ], :int
  attach_function :sf_write_sync, [ :pointer ], :void
