require File.dirname(__FILE__) + '/../spec_helper.rb'

describe AlsaBackup::Writer do

  before(:each) do
    @file = "test.wav"
    @directory = test_directory
    @recorder = AlsaBackup::Writer.new(@file, @directory)
  end

  describe "file" do
    
    it "should accept file as string" do
      @recorder.file = file_name = "dummy"
      @recorder.file.should == file_name
    end

    it "should accept file as Proc" do
      file_name = "dummy"
      @recorder.file = Proc.new { file_name }
      @recorder.file.should == file_name
    end
    
  end

end
