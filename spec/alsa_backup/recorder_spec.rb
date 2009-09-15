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

  it "should use the specified alsa device" do
    @recorder.device = alsa_device = "dummy"
    ALSA::PCM::Capture.should_receive(:open).with(alsa_device, anything)
    @recorder.open_capture
  end

  it "should use the specified sample rate" do
    @recorder.sample_rate = 48000
    @recorder.format[:sample_rate].should == @recorder.sample_rate
  end

  it "should use the specified channels" do
    @recorder.channels = 4
    @recorder.format[:channels].should == @recorder.channels
  end

  it "should use 44100 as default sample rate" do
    @recorder.sample_rate.should == 44100
  end

  it "should use 2 as default channels" do
    @recorder.channels.should == 2
  end

  it "should use hw:0 as default device" do
    @recorder.device.should == "hw:0"
  end

  it "should stop the recording on Interrupt error" do
    @recorder.stub!(:open_writer).and_raise(Interrupt)
    @recorder.start
  end

  describe "error handler" do

    class TestErrorHandler

      def initialize(proc)
        proc = Proc.new { |e| proc } unless Proc == proc
        @proc = proc
      end

      def call(e)
        if @proc
          response = @proc.call(e)
          @proc = nil
          response
        end
      end

    end
    
    before(:each) do
      AlsaBackup::Writer.stub!(:open).and_raise("dummy")
      @recorder.stub!(:sleep)
    end

    it "should raise error when error handler is nil" do
      @recorder.error_handler = nil
      lambda { @recorder.start }.should raise_error
    end

    it "should raise error when error handler returns nil or false" do
      @recorder.error_handler = TestErrorHandler.new(nil)
      lambda { @recorder.start }.should raise_error
    end

    def start_recorder(limit = nil)
      @recorder.start(limit)
    rescue RuntimeError

    end

    it "should retry when error handler returns something (not false or nil)" do
      @recorder.error_handler = TestErrorHandler.new(true)
      AlsaBackup::Writer.should_receive(:open).twice().and_raise("dummy")

      start_recorder
    end

    it "should use the error handler response as sleep time if numerical" do
      @recorder.error_handler = TestErrorHandler.new(error_handler_response = 5)
      @recorder.should_receive(:sleep).with(error_handler_response)
      start_recorder
    end

    it "should sleep 5 seconds when the error handler response is a number" do
      @recorder.error_handler = TestErrorHandler.new(true)
      @recorder.should_receive(:sleep).with(5)
      start_recorder
    end

    it "should not use error handler when recorder is started with a time length" do
      @recorder.error_handler = mock("error_handler")
      @recorder.error_handler.should_not_receive(:call)

      start_recorder(2)
    end

  end

end
