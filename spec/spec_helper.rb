begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'alsa_backup'

def test_directory
  directory = File.dirname(__FILE__) + '/../tmp'
  Dir.mkdir(directory) unless File.exists?(directory)
  directory
end

def test_file(name = 'test.wav')
  File.join(test_directory, name)
end

def fixture_file(name)
  File.dirname(__FILE__) + '/fixtures/' + name
end

log_dir = File.dirname(__FILE__) + '/../log/'
Dir.mkdir(log_dir) unless File.exists?(log_dir)

ALSA::logger = AlsaBackup.logger = 
  Logger.new(File.join(log_dir,'test.log'))
