require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'alsa_backup/recorder'

describe AlsaBackup::Recorder do

  before(:each) do
    @recorder = AlsaBackup::Recorder.new
  end

  it "should not raise an error on start" do
    lambda { @recorder.start }.should_not raise_error
  end

end
