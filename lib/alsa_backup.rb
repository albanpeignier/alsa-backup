$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module AlsaBackup
  VERSION = '0.0.1'

  def self.recorder
    @recorder ||= AlsaBackup::Recorder.new
  end

end

require 'alsa_backup/recorder'

