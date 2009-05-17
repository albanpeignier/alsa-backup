begin
  require 'spec'
rescue LoadError
  require 'rubygems' unless ENV['NO_RUBYGEMS']
  gem 'rspec'
  require 'spec'
end

$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'alsa_backup'

def test_file(name = 'test.wav')
  File.dirname(__FILE__) + '/../tmp/' + name
end
