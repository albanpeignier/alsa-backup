require File.dirname(__FILE__) + '/../spec_helper.rb'

describe Time do
  
  describe "floor" do
    
    it "should change xh41 on xh49 for min with a modulo of 10" do
      time = Time.now.change(:min => 49)
      time.floor(:min, 10).should == time.change(:min => 40)
    end

  end

end

describe File do

  describe "suffix_basename" do

    def take_this_form(expected_file)
      simple_matcher("have this #{expected_file}") do |actual|
        File.suffix_basename(actual,'<prefix>') == expected_file
      end
    end

    it { 'test.rb'.should take_this_form('test<prefix>.rb') }
    
    it "should return test<prefix> for test" do
      File.suffix_basename('test','<prefix>').should == 'test<prefix>'
    end

    it "should return /path/test<prefix>.rb for /patest" do
      File.suffix_basename('/path/test.rb','<prefix>').should == '/path/test<prefix>.rb'
    end

    it "should return /test<prefix>.rb for /test.rb" do
      File.suffix_basename('/path/test.rb','<prefix>').should == '/path/test<prefix>.rb'
    end

  end

end
