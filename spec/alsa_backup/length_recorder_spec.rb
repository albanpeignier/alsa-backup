require File.dirname(__FILE__) + '/../spec_helper.rb'

describe AlsaBackup::LengthController do

  def continue_after(frame_count)
    simple_matcher("continue after #{frame_count} frames") do |actual|
      actual.continue_after?(frame_count)
    end
  end
  
  describe AlsaBackup::LengthController::Loop do

    before(:each) do
      @controller = AlsaBackup::LengthController::Loop.new
    end
    
    it "should always continue" do
      @controller.should continue_after(123)
    end

  end

  describe AlsaBackup::LengthController::FrameCount do

    before(:each) do
      @controller = AlsaBackup::LengthController::FrameCount.new(123)
    end
    
    it "should not continue after controller frame count" do
      @controller.should_not continue_after(@controller.frame_count)
    end

    it "should decrement controller frame count after each test" do
      lambda {
        @controller.continue_after?(10)
      }.should change(@controller, :frame_count).by(-10)
    end

  end

end
