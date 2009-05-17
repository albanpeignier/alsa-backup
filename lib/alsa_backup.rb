$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'logger'

module AlsaBackup
  VERSION = '0.0.1'

  def self.recorder
    @recorder ||= AlsaBackup::Recorder.new
  end

  def self.config
    yield self.recorder
  end

  def self.logger
    unless @logger
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    end

    @logger
  end

  def self.logger=(logger); @logger = logger; end

end

require 'alsa_backup/recorder'

