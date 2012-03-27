require 'spec_helper'

describe CanvasController do
  describe "index" do
    it "has json" do
      get :index, :path => "./spec/fixtures/rspec_test.json"
      assigns(:json).should_not be_nil
    end
    
    it "show only backgtound" do
      get :index
      assigns(:json).should be_nil
    end
    
    it "with wrong params" do
      get :index, :path => "test"
      assigns(:json).should be_nil
    end
  end
end
