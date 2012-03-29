require 'spec_helper'

describe ResourcesHelper do
  describe "get filename" do
    it "get filename successfully" do
      get_filename("./tmp/test.json").should == "test.json"
    end
    it "get filename from short path" do
      get_filename("test.json").should == "test.json"      
    end
    it "get nil from brank" do
      get_filename("").should == nil            
    end
  end
end
