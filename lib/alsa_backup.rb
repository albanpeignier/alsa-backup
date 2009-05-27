$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

begin
  require 'rubygems'
rescue LoadError
end

require 'activesupport'
require 'logger'

module AlsaBackup
  VERSION = '0.0.5'

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

require 'alsa_backup/core_ext'
require 'alsa_backup/length_controller'
require 'alsa_backup/writer'
require 'alsa_backup/recorder'



