  SND_PCM_CLASS_GENERIC = 0
  SND_PCM_CLASS_MULTI = 1
  SND_PCM_CLASS_MODEM = 2
  SND_PCM_CLASS_DIGITIZER = 3
  SND_PCM_CLASS_LAST = SND_PCM_CLASS_DIGITIZER

  SND_PCM_SUBCLASS_GENERIC_MIX = 0
  SND_PCM_SUBCLASS_MULTI_MIX = 1
  SND_PCM_SUBCLASS_LAST = SND_PCM_SUBCLASS_MULTI_MIX

  SND_PCM_STREAM_PLAYBACK = 0
  SND_PCM_STREAM_CAPTURE = 1
  SND_PCM_STREAM_LAST = SND_PCM_STREAM_CAPTURE

  SND_PCM_ACCESS_MMAP_INTERLEAVED = 0
  SND_PCM_ACCESS_MMAP_NONINTERLEAVED = 1
  SND_PCM_ACCESS_MMAP_COMPLEX = 2
  SND_PCM_ACCESS_RW_INTERLEAVED = 3
  SND_PCM_ACCESS_RW_NONINTERLEAVED = 4
  SND_PCM_ACCESS_LAST = SND_PCM_ACCESS_RW_NONINTERLEAVED

  SND_PCM_FORMAT_UNKNOWN = -1
  SND_PCM_FORMAT_S8 = 0
  SND_PCM_FORMAT_U8 = 1
  SND_PCM_FORMAT_S32_LE = 10
  SND_PCM_FORMAT_S32_BE = 11
  SND_PCM_FORMAT_U32_LE = 12
  SND_PCM_FORMAT_U32_BE = 13
  SND_PCM_FORMAT_FLOAT_LE = 14
  SND_PCM_FORMAT_FLOAT_BE = 15
  SND_PCM_FORMAT_FLOAT64_LE = 16
  SND_PCM_FORMAT_FLOAT64_BE = 17
  SND_PCM_FORMAT_IEC958_SUBFRAME_LE = 18
  SND_PCM_FORMAT_IEC958_SUBFRAME_BE = 19
  SND_PCM_FORMAT_S16_LE = 2
  SND_PCM_FORMAT_MU_LAW = 20
  SND_PCM_FORMAT_A_LAW = 21
  SND_PCM_FORMAT_IMA_ADPCM = 22
  SND_PCM_FORMAT_MPEG = 23
  SND_PCM_FORMAT_GSM = 24
  SND_PCM_FORMAT_S16_BE = 3
  SND_PCM_FORMAT_SPECIAL = 31
  SND_PCM_FORMAT_S24_3LE = 32
  SND_PCM_FORMAT_S24_3BE = 33
  SND_PCM_FORMAT_U24_3LE = 34
  SND_PCM_FORMAT_U24_3BE = 35
  SND_PCM_FORMAT_S20_3LE = 36
  SND_PCM_FORMAT_S20_3BE = 37
  SND_PCM_FORMAT_U20_3LE = 38
  SND_PCM_FORMAT_U20_3BE = 39
  SND_PCM_FORMAT_U16_LE = 4
  SND_PCM_FORMAT_S18_3LE = 40
  SND_PCM_FORMAT_S18_3BE = 41
  SND_PCM_FORMAT_U18_3LE = 42
  SND_PCM_FORMAT_U18_3BE = 43
  SND_PCM_FORMAT_U16_BE = 5
  SND_PCM_FORMAT_S24_LE = 6
  SND_PCM_FORMAT_S24_BE = 7
  SND_PCM_FORMAT_U24_LE = 8
  SND_PCM_FORMAT_U24_BE = 9
  SND_PCM_FORMAT_FLOAT64 = SND_PCM_FORMAT_FLOAT64_LE
  SND_PCM_FORMAT_FLOAT = SND_PCM_FORMAT_FLOAT_LE
  SND_PCM_FORMAT_IEC958_SUBFRAME = SND_PCM_FORMAT_IEC958_SUBFRAME_LE
  SND_PCM_FORMAT_S16 = SND_PCM_FORMAT_S16_LE
  SND_PCM_FORMAT_S24 = SND_PCM_FORMAT_S24_LE
  SND_PCM_FORMAT_S32 = SND_PCM_FORMAT_S32_LE
  SND_PCM_FORMAT_U16 = SND_PCM_FORMAT_U16_LE
  SND_PCM_FORMAT_LAST = SND_PCM_FORMAT_U18_3BE
  SND_PCM_FORMAT_U24 = SND_PCM_FORMAT_U24_LE
  SND_PCM_FORMAT_U32 = SND_PCM_FORMAT_U32_LE

  SND_PCM_SUBFORMAT_STD = 0
  SND_PCM_SUBFORMAT_LAST = SND_PCM_SUBFORMAT_STD

  SND_PCM_STATE_OPEN = 0
  SND_PCM_STATE_SETUP = 1
  SND_PCM_STATE_PREPARED = 2
  SND_PCM_STATE_RUNNING = 3
  SND_PCM_STATE_XRUN = 4
  SND_PCM_STATE_DRAINING = 5
  SND_PCM_STATE_PAUSED = 6
  SND_PCM_STATE_SUSPENDED = 7
  SND_PCM_STATE_DISCONNECTED = 8
  SND_PCM_STATE_LAST = SND_PCM_STATE_DISCONNECTED

  SND_PCM_START_DATA = 0
  SND_PCM_START_EXPLICIT = 1
  SND_PCM_START_LAST = SND_PCM_START_EXPLICIT

  SND_PCM_XRUN_NONE = 0
  SND_PCM_XRUN_STOP = 1
  SND_PCM_XRUN_LAST = SND_PCM_XRUN_STOP

  SND_PCM_TSTAMP_NONE = 0
  SND_PCM_TSTAMP_ENABLE = 1
  SND_PCM_TSTAMP_LAST = SND_PCM_TSTAMP_ENABLE
  SND_PCM_TSTAMP_MMAP = SND_PCM_TSTAMP_ENABLE

  SND_PCM_NONBLOCK = 0x00000001
  SND_PCM_ASYNC = 0x00000002
  SND_PCM_NO_AUTO_RESAMPLE = 0x00010000
  SND_PCM_NO_AUTO_CHANNELS = 0x00020000
  SND_PCM_NO_AUTO_FORMAT = 0x00040000
  SND_PCM_NO_SOFTVOL = 0x00080000
  SND_PCM_TYPE_HW = 0
  SND_PCM_TYPE_HOOKS = 1
  SND_PCM_TYPE_MULAW = 10
  SND_PCM_TYPE_ADPCM = 11
  SND_PCM_TYPE_RATE = 12
  SND_PCM_TYPE_ROUTE = 13
  SND_PCM_TYPE_PLUG = 14
  SND_PCM_TYPE_SHARE = 15
  SND_PCM_TYPE_METER = 16
  SND_PCM_TYPE_MIX = 17
  SND_PCM_TYPE_DROUTE = 18
  SND_PCM_TYPE_LBSERVER = 19
  SND_PCM_TYPE_MULTI = 2
  SND_PCM_TYPE_LINEAR_FLOAT = 20
  SND_PCM_TYPE_LADSPA = 21
  SND_PCM_TYPE_DMIX = 22
  SND_PCM_TYPE_JACK = 23
  SND_PCM_TYPE_DSNOOP = 24
  SND_PCM_TYPE_DSHARE = 25
  SND_PCM_TYPE_IEC958 = 26
  SND_PCM_TYPE_SOFTVOL = 27
  SND_PCM_TYPE_IOPLUG = 28
  SND_PCM_TYPE_EXTPLUG = 29
  SND_PCM_TYPE_FILE = 3
  SND_PCM_TYPE_MMAP_EMUL = 30
  SND_PCM_TYPE_NULL = 4
  SND_PCM_TYPE_SHM = 5
  SND_PCM_TYPE_INET = 6
  SND_PCM_TYPE_COPY = 7
  SND_PCM_TYPE_LINEAR = 8
  SND_PCM_TYPE_ALAW = 9
  SND_PCM_TYPE_LAST = SND_PCM_TYPE_MMAP_EMUL

  class SndPcmChannelArea < FFI::Struct
    layout(
           :addr, :pointer,
           :first, :uint,
           :step, :uint
    )
  end
  class SndPcmSyncId < FFI::Union
    layout(
           :id, [:uchar, 16],
           :id16, [:ushort, 8],
           :id32, [:uint, 4]
    )
  end
  attach_function :snd_pcm_open, [ :pointer, :string, :int, :int ], :int
  attach_function :snd_pcm_open_lconf, [ :pointer, :string, :int, :int, :pointer ], :int
  attach_function :snd_pcm_close, [ :pointer ], :int
  attach_function :snd_pcm_name, [ :pointer ], :string
  attach_function :snd_pcm_type, [ :pointer ], :int
  attach_function :snd_pcm_stream, [ :pointer ], :int
  attach_function :snd_pcm_poll_descriptors_count, [ :pointer ], :int
  attach_function :snd_pcm_poll_descriptors, [ :pointer, :pointer, :uint ], :int
  attach_function :snd_pcm_poll_descriptors_revents, [ :pointer, :pointer, :uint, :pointer ], :int
  attach_function :snd_pcm_nonblock, [ :pointer, :int ], :int
  attach_function :snd_async_add_pcm_handler, [ :pointer, :pointer, snd_async_callback_t, :pointer ], :int
  attach_function :snd_async_handler_get_pcm, [ :pointer ], :pointer
  attach_function :snd_pcm_info, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_current, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_free, [ :pointer ], :int
  attach_function :snd_pcm_sw_params_current, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_prepare, [ :pointer ], :int
  attach_function :snd_pcm_reset, [ :pointer ], :int
  attach_function :snd_pcm_status, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_start, [ :pointer ], :int
  attach_function :snd_pcm_drop, [ :pointer ], :int
  attach_function :snd_pcm_drain, [ :pointer ], :int
  attach_function :snd_pcm_pause, [ :pointer, :int ], :int
  attach_function :snd_pcm_state, [ :pointer ], :int
  attach_function :snd_pcm_hwsync, [ :pointer ], :int
  attach_function :snd_pcm_delay, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_resume, [ :pointer ], :int
  attach_function :snd_pcm_htimestamp, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_avail, [ :pointer ], :long
  attach_function :snd_pcm_avail_update, [ :pointer ], :long
  attach_function :snd_pcm_avail_delay, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_rewindable, [ :pointer ], :long
  attach_function :snd_pcm_rewind, [ :pointer, :ulong ], :long
  attach_function :snd_pcm_forwardable, [ :pointer ], :long
  attach_function :snd_pcm_forward, [ :pointer, :ulong ], :long
  attach_function :snd_pcm_writei, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_readi, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_writen, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_readn, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_wait, [ :pointer, :int ], :int
  attach_function :snd_pcm_link, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_unlink, [ :pointer ], :int
  attach_function :snd_pcm_recover, [ :pointer, :int, :int ], :int
  attach_function :snd_pcm_set_params, [ :pointer, :int, :int, :uint, :uint, :int, :uint ], :int
  attach_function :snd_pcm_get_params, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_info_sizeof, [  ], :uint
  attach_function :snd_pcm_info_malloc, [ :pointer ], :int
  attach_function :snd_pcm_info_free, [ :pointer ], :void
  attach_function :snd_pcm_info_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_info_get_device, [ :pointer ], :uint
  attach_function :snd_pcm_info_get_subdevice, [ :pointer ], :uint
  attach_function :snd_pcm_info_get_stream, [ :pointer ], :int
  attach_function :snd_pcm_info_get_card, [ :pointer ], :int
  attach_function :snd_pcm_info_get_id, [ :pointer ], :string
  attach_function :snd_pcm_info_get_name, [ :pointer ], :string
  attach_function :snd_pcm_info_get_subdevice_name, [ :pointer ], :string
  attach_function :snd_pcm_info_get_class, [ :pointer ], :int
  attach_function :snd_pcm_info_get_subclass, [ :pointer ], :int
  attach_function :snd_pcm_info_get_subdevices_count, [ :pointer ], :uint
  attach_function :snd_pcm_info_get_subdevices_avail, [ :pointer ], :uint
  attach_function :snd_pcm_info_get_sync, [ :pointer ], SndPcmSyncId
  attach_function :snd_pcm_info_set_device, [ :pointer, :uint ], :void
  attach_function :snd_pcm_info_set_subdevice, [ :pointer, :uint ], :void
  attach_function :snd_pcm_info_set_stream, [ :pointer, :int ], :void
  attach_function :snd_pcm_hw_params_any, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_can_mmap_sample_resolution, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_double, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_batch, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_block_transfer, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_monotonic, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_overrange, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_forward, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_rewind, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_pause, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_resume, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_half_duplex, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_is_joint_duplex, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_can_sync_start, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_get_rate_numden, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_sbits, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_get_fifo_size, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_sizeof, [  ], :uint
  attach_function :snd_pcm_hw_params_malloc, [ :pointer ], :int
  attach_function :snd_pcm_hw_params_free, [ :pointer ], :void
  attach_function :snd_pcm_hw_params_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_hw_params_get_access, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_access, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_access, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_access_first, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_access_last, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_access_mask, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_access_mask, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_format, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_format, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_format, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_format_first, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_format_last, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_format_mask, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_format_mask, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_hw_params_get_subformat, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_subformat, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_subformat, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_hw_params_set_subformat_first, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_subformat_last, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_subformat_mask, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_subformat_mask, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_hw_params_get_channels, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_channels_min, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_channels_max, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_channels, [ :pointer, :pointer, :uint ], :int
  attach_function :snd_pcm_hw_params_set_channels, [ :pointer, :pointer, :uint ], :int
  attach_function :snd_pcm_hw_params_set_channels_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_channels_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_channels_minmax, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_channels_near, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_channels_first, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_channels_last, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_rate, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_rate_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_rate_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_rate, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_rate, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_rate_min, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_max, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_minmax, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_near, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_first, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_last, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_rate_resample, [ :pointer, :pointer, :uint ], :int
  attach_function :snd_pcm_hw_params_get_rate_resample, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_export_buffer, [ :pointer, :pointer, :uint ], :int
  attach_function :snd_pcm_hw_params_get_export_buffer, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_time, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_time_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_time_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_period_time, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_period_time, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_period_time_min, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_time_max, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_time_minmax, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_time_near, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_time_first, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_time_last, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_size, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_size_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_period_size_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_period_size, [ :pointer, :pointer, :ulong, :int ], :int
  attach_function :snd_pcm_hw_params_set_period_size, [ :pointer, :pointer, :ulong, :int ], :int
  attach_function :snd_pcm_hw_params_set_period_size_min, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_max, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_minmax, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_near, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_first, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_last, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_period_size_integer, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_periods, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_periods_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_periods_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_periods, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_periods, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_periods_min, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_max, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_minmax, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_near, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_first, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_last, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_periods_integer, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_time, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_time_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_time_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_buffer_time, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time, [ :pointer, :pointer, :uint, :int ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_min, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_max, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_minmax, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_near, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_first, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_time_last, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_size, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_size_min, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_buffer_size_max, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_test_buffer_size, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_min, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_max, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_minmax, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_near, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_first, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_set_buffer_size_last, [ :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_get_min_align, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_sizeof, [  ], :uint
  attach_function :snd_pcm_sw_params_malloc, [ :pointer ], :int
  attach_function :snd_pcm_sw_params_free, [ :pointer ], :void
  attach_function :snd_pcm_sw_params_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_sw_params_get_boundary, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_tstamp_mode, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_sw_params_get_tstamp_mode, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_avail_min, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_sw_params_get_avail_min, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_period_event, [ :pointer, :pointer, :int ], :int
  attach_function :snd_pcm_sw_params_get_period_event, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_start_threshold, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_sw_params_get_start_threshold, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_stop_threshold, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_sw_params_get_stop_threshold, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_silence_threshold, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_sw_params_get_silence_threshold, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_set_silence_size, [ :pointer, :pointer, :ulong ], :int
  attach_function :snd_pcm_sw_params_get_silence_size, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_access_mask_sizeof, [  ], :uint
  attach_function :snd_pcm_access_mask_malloc, [ :pointer ], :int
  attach_function :snd_pcm_access_mask_free, [ :pointer ], :void
  attach_function :snd_pcm_access_mask_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_access_mask_none, [ :pointer ], :void
  attach_function :snd_pcm_access_mask_any, [ :pointer ], :void
  attach_function :snd_pcm_access_mask_test, [ :pointer, :int ], :int
  attach_function :snd_pcm_access_mask_empty, [ :pointer ], :int
  attach_function :snd_pcm_access_mask_set, [ :pointer, :int ], :void
  attach_function :snd_pcm_access_mask_reset, [ :pointer, :int ], :void
  attach_function :snd_pcm_format_mask_sizeof, [  ], :uint
  attach_function :snd_pcm_format_mask_malloc, [ :pointer ], :int
  attach_function :snd_pcm_format_mask_free, [ :pointer ], :void
  attach_function :snd_pcm_format_mask_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_format_mask_none, [ :pointer ], :void
  attach_function :snd_pcm_format_mask_any, [ :pointer ], :void
  attach_function :snd_pcm_format_mask_test, [ :pointer, :int ], :int
  attach_function :snd_pcm_format_mask_empty, [ :pointer ], :int
  attach_function :snd_pcm_format_mask_set, [ :pointer, :int ], :void
  attach_function :snd_pcm_format_mask_reset, [ :pointer, :int ], :void
  attach_function :snd_pcm_subformat_mask_sizeof, [  ], :uint
  attach_function :snd_pcm_subformat_mask_malloc, [ :pointer ], :int
  attach_function :snd_pcm_subformat_mask_free, [ :pointer ], :void
  attach_function :snd_pcm_subformat_mask_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_subformat_mask_none, [ :pointer ], :void
  attach_function :snd_pcm_subformat_mask_any, [ :pointer ], :void
  attach_function :snd_pcm_subformat_mask_test, [ :pointer, :int ], :int
  attach_function :snd_pcm_subformat_mask_empty, [ :pointer ], :int
  attach_function :snd_pcm_subformat_mask_set, [ :pointer, :int ], :void
  attach_function :snd_pcm_subformat_mask_reset, [ :pointer, :int ], :void
  attach_function :snd_pcm_status_sizeof, [  ], :uint
  attach_function :snd_pcm_status_malloc, [ :pointer ], :int
  attach_function :snd_pcm_status_free, [ :pointer ], :void
  attach_function :snd_pcm_status_copy, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_status_get_state, [ :pointer ], :int
  attach_function :snd_pcm_status_get_trigger_tstamp, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_status_get_trigger_htstamp, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_status_get_tstamp, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_status_get_htstamp, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_status_get_delay, [ :pointer ], :long
  attach_function :snd_pcm_status_get_avail, [ :pointer ], :ulong
  attach_function :snd_pcm_status_get_avail_max, [ :pointer ], :ulong
  attach_function :snd_pcm_status_get_overrange, [ :pointer ], :ulong
  attach_function :snd_pcm_type_name, [ :int ], :string
  attach_function :snd_pcm_stream_name, [ :int ], :string
  attach_function :snd_pcm_access_name, [ :int ], :string
  attach_function :snd_pcm_format_name, [ :int ], :string
  attach_function :snd_pcm_format_description, [ :int ], :string
  attach_function :snd_pcm_subformat_name, [ :int ], :string
  attach_function :snd_pcm_subformat_description, [ :int ], :string
  attach_function :snd_pcm_format_value, [ :string ], :int
  attach_function :snd_pcm_tstamp_mode_name, [ :int ], :string
  attach_function :snd_pcm_state_name, [ :int ], :string
  attach_function :snd_pcm_dump, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_dump_hw_setup, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_dump_sw_setup, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_dump_setup, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_hw_params_dump, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_sw_params_dump, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_status_dump, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_mmap_begin, [ :pointer, :pointer, :pointer, :pointer ], :int
  attach_function :snd_pcm_mmap_commit, [ :pointer, :ulong, :ulong ], :long
  attach_function :snd_pcm_mmap_writei, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_mmap_readi, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_mmap_writen, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_mmap_readn, [ :pointer, :pointer, :ulong ], :long
  attach_function :snd_pcm_format_signed, [ :int ], :int
  attach_function :snd_pcm_format_unsigned, [ :int ], :int
  attach_function :snd_pcm_format_linear, [ :int ], :int
  attach_function :snd_pcm_format_float, [ :int ], :int
  attach_function :snd_pcm_format_little_endian, [ :int ], :int
  attach_function :snd_pcm_format_big_endian, [ :int ], :int
  attach_function :snd_pcm_format_cpu_endian, [ :int ], :int
  attach_function :snd_pcm_format_width, [ :int ], :int
  attach_function :snd_pcm_format_physical_width, [ :int ], :int
  attach_function :snd_pcm_build_linear_format, [ :int, :int, :int, :int ], :int
  attach_function :snd_pcm_format_size, [ :int, :uint ], ssize_t
  attach_function :snd_pcm_format_silence, [ :int ], u_int8_t
  attach_function :snd_pcm_format_silence_16, [ :int ], u_int16_t
  attach_function :snd_pcm_format_silence_32, [ :int ], u_int32_t
  attach_function :snd_pcm_format_silence_64, [ :int ], u_int64_t
  attach_function :snd_pcm_format_set_silence, [ :int, :pointer, :uint ], :int
  attach_function :snd_pcm_bytes_to_frames, [ :pointer, ssize_t ], :long
  attach_function :snd_pcm_frames_to_bytes, [ :pointer, :long ], ssize_t
  attach_function :snd_pcm_bytes_to_samples, [ :pointer, ssize_t ], :long
  attach_function :snd_pcm_samples_to_bytes, [ :pointer, :long ], ssize_t
  attach_function :snd_pcm_area_silence, [ :pointer, :ulong, :uint, :int ], :int
  attach_function :snd_pcm_areas_silence, [ :pointer, :ulong, :uint, :ulong, :int ], :int
  attach_function :snd_pcm_area_copy, [ :pointer, :ulong, :pointer, :ulong, :uint, :int ], :int
  attach_function :snd_pcm_areas_copy, [ :pointer, :ulong, :pointer, :ulong, :uint, :ulong, :int ], :int
  SND_PCM_HOOK_TYPE_HW_PARAMS = 0
  SND_PCM_HOOK_TYPE_HW_FREE = 1
  SND_PCM_HOOK_TYPE_CLOSE = 2
  SND_PCM_HOOK_TYPE_LAST = SND_PCM_HOOK_TYPE_CLOSE

  callback(:snd_pcm_hook_func_t, [ :pointer ], :int)
  attach_function :snd_pcm_hook_get_pcm, [ :pointer ], :pointer
  attach_function :snd_pcm_hook_get_private, [ :pointer ], :pointer
  attach_function :snd_pcm_hook_set_private, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_hook_add, [ :pointer, :pointer, :int, :snd_pcm_hook_func_t, :pointer ], :int
  attach_function :snd_pcm_hook_remove, [ :pointer ], :int
  class SndPcmScopeOps < FF::Struct
    layout(
           :enable, callback([ :pointer ], :int),
           :disable, callback([ :pointer ], :void),
           :start, callback([ :pointer ], :void),
           :stop, callback([ :pointer ], :void),
           :update, callback([ :pointer ], :void),
           :reset, callback([ :pointer ], :void),
           :close, callback([ :pointer ], :void)
    )
    def enable=(cb)
      @enable = cb
      self[:enable] = @enable
    end
    def enable
      @enable
    end
    def disable=(cb)
      @disable = cb
      self[:disable] = @disable
    end
    def disable
      @disable
    end
    def start=(cb)
      @start = cb
      self[:start] = @start
    end
    def start
      @start
    end
    def stop=(cb)
      @stop = cb
      self[:stop] = @stop
    end
    def stop
      @stop
    end
    def update=(cb)
      @update = cb
      self[:update] = @update
    end
    def update
      @update
    end
    def reset=(cb)
      @reset = cb
      self[:reset] = @reset
    end
    def reset
      @reset
    end
    def close=(cb)
      @close = cb
      self[:close] = @close
    end
    def close
      @close
    end

  end
  attach_function :snd_pcm_meter_get_bufsize, [ :pointer ], :ulong
  attach_function :snd_pcm_meter_get_channels, [ :pointer ], :uint
  attach_function :snd_pcm_meter_get_rate, [ :pointer ], :uint
  attach_function :snd_pcm_meter_get_now, [ :pointer ], :ulong
  attach_function :snd_pcm_meter_get_boundary, [ :pointer ], :ulong
  attach_function :snd_pcm_meter_add_scope, [ :pointer, :pointer ], :int
  attach_function :snd_pcm_meter_search_scope, [ :pointer, :string ], :pointer
  attach_function :snd_pcm_scope_malloc, [ :pointer ], :int
  attach_function :snd_pcm_scope_set_ops, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_scope_set_name, [ :pointer, :string ], :void
  attach_function :snd_pcm_scope_get_name, [ :pointer ], :string
  attach_function :snd_pcm_scope_get_callback_private, [ :pointer ], :pointer
  attach_function :snd_pcm_scope_set_callback_private, [ :pointer, :pointer ], :void
  attach_function :snd_pcm_scope_s16_open, [ :pointer, :string, :pointer ], :int
  attach_function :snd_pcm_scope_s16_get_channel_buffer, [ :pointer, :uint ], :pointer
  SND_SPCM_LATENCY_STANDARD = 0
  SND_SPCM_LATENCY_MEDIUM = 1
  SND_SPCM_LATENCY_REALTIME = 2

  SND_SPCM_XRUN_IGNORE = 0
  SND_SPCM_XRUN_STOP = 1

  SND_SPCM_DUPLEX_LIBERAL = 0
  SND_SPCM_DUPLEX_PEDANTIC = 1

  attach_function :snd_spcm_init, [ :pointer, :uint, :uint, :int, :int, :int, :int, :int ], :int
  attach_function :snd_spcm_init_duplex, [ :pointer, :pointer, :uint, :uint, :int, :int, :int, :int, :int, :int ], :int
  attach_function :snd_spcm_init_get_params, [ :pointer, :pointer, :pointer, :pointer ], :int
