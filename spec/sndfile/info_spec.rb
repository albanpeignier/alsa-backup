require File.dirname(__FILE__) + '/../spec_helper.rb'

require 'sndfile'

describe Sndfile::Info do

  before(:each) do
    @info = Sndfile::Info.new
  end
  
  describe "normalized_format" do
    
    it "should transform 'wav pcm_16' into [wav, pcm_16]" do
      Sndfile::Info.normalized_format('wav pcm_16').should == %w{wav pcm_16}
    end

  end

  describe "format" do
    
    it "should be normalized when set" do
      @info.format = 'wav pcm_16'
      @info.format.should == %w{wav pcm_16}
    end

  end

  describe "native_format" do
    
    it "should return (Format::WAV|Format::PCM_16) for 'wav pcm_16'" do
      @info.format = 'wav pcm_16'
      @info.native_format.should == Sndfile::Native::Format::WAV | Sndfile::Native::Format::PCM_16
    end

  end


end
