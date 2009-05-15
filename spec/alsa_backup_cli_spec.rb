require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

require 'alsa_backup/cli'
require 'alsa_backup/recorder'

describe AlsaBackup::CLI, "execute" do
  before(:each) do
    @stdout_io = StringIO.new

    @recorder = AlsaBackup::Recorder.new
    AlsaBackup::Recorder.stub!(:new).and_return(@recorder)
  end

  def execute_cli
    AlsaBackup::CLI.execute(@stdout_io, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  it "should create an AlsaBackup::Recorder" do
    AlsaBackup::Recorder.should_receive(:new).and_return(@recorder)
    execute_cli
  end

  it "should start the AlsaBackup::Recorder" do
    @recorder.should_receive(:start)
    execute_cli
  end
end
