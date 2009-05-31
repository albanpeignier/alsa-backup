require File.dirname(__FILE__) + '/../spec_helper.rb'

describe AlsaBackup::Writer do

  before(:each) do
    @file = "test.wav"
    @directory = test_directory
    @writer = AlsaBackup::Writer.new(@file, @directory)
  end

  describe "file" do
    
    it "should accept file as string" do
      @writer.file = file_name = "dummy"
      @writer.file.should == file_name
    end

    it "should accept file as Proc" do
      file_name = "dummy"
      @writer.file = Proc.new { file_name }
      @writer.file.should == file_name
    end
    
  end

  describe "rename_existing_file" do

    it "should keep file if not exists" do
      File.should_receive(:exists?).with(@file).and_return(false)
      File.should_not_receive(:rename)
      AlsaBackup::Writer.rename_existing_file(@file)
    end

    it "should try to suffix with '-n' to find a free name" do
      File.stub!(:exists?).and_return(true)

      free_file = File.suffix_basename(@file, "-99")
      File.should_receive(:exists?).with(free_file).and_return(false)

      File.should_receive(:rename).with(@file, free_file)
      AlsaBackup::Writer.rename_existing_file(@file)
    end

    it "should raise an error when no free file is found" do
      File.stub!(:exists?).and_return(true)
      lambda do
        AlsaBackup::Writer.rename_existing_file(@file)
      end.should raise_error
    end

  end

  describe "close" do

    it "should close current sndfile" do
      sndfile = @writer.sndfile
      sndfile.should_receive(:close)
      @writer.close      
    end
    
    it "should remove closed file if it doesn't contain data" do
      @writer.sndfile

      File.stub!(:exists?).and_return(true)
      File.stub!(:size).and_return(44)

      File.should_receive(:delete).with(@writer.target_file)

      @writer.close
    end

  end

end
