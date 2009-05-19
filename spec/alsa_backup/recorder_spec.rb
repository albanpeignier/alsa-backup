require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'alsa_backup/recorder'

describe AlsaBackup::Recorder do

  before(:each) do
    @file = test_file
    @recorder = AlsaBackup::Recorder.new(@file)
  end

  it "should not raise an error on start" do
    lambda { @recorder.start(2) }.should_not raise_error
  end

end
