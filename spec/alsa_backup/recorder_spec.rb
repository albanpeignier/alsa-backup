require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'alsa_backup/recorder'

describe AlsaBackup::Recorder do

  before(:each) do
    @recorder = AlsaBackup::Recorder.new
  end

  it "should not raise an error on start" do
    lambda do 
      begin
        @recorder.start 
      rescue Exception => e
        puts e.backtrace.join("\n")
        raise e
      end
    end.should_not raise_error
  end

end
