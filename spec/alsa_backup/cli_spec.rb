require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'alsa_backup/cli'

describe AlsaBackup::CLI, "execute" do
  before(:each) do
    @stdout_io = StringIO.new
    @file = test_file

    @recorder = AlsaBackup::Recorder.new(@file)
    @recorder.stub!(:start)
    AlsaBackup.stub!(:recorder).and_return(@recorder)
  end

  def execute_cli(options = {})
    options = { :file => @file, :length => 2 }.update(options)
    arguments = options.collect do |key,value| 
      "--#{key}=#{value}" if value
    end.compact
    
    AlsaBackup::CLI.execute(@stdout_io, *arguments)
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  it "should use AlsaBackup.recorder" do
    AlsaBackup.should_receive(:recorder).and_return(@recorder)
    execute_cli
  end

  it "should set the record file with specified one" do
    @recorder.should_receive(:file=).with(file = "dummy")
    execute_cli :file => file
  end

  it "should start the AlsaBackup.recorder" do
    @recorder.should_receive(:start)
    execute_cli
  end

  it "should start the recorder with specified length" do
    @recorder.should_receive(:start).with(length = 60)
    execute_cli :length => length
  end

  it "should start the record without length if not specified" do
    @recorder.should_receive(:start).with(nil)
    execute_cli :length => nil
  end

end
