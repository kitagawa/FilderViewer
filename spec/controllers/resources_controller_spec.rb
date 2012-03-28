# -*- encoding : utf-8 -*-
require 'spec_helper'

describe ResourcesController do
  describe "create" do
    before do
      post :create, :path => fixture_file_upload("/rspec_test.json",'application/json')
    end
    it "upload file" do
      FileTest.exist?("tmp/rspec_test.json").should be_true
    end

    it "return to list" do
      response.should redirect_to(resources_path)
      flash[:notice].should == "ファイルのアップロードを行いました。"          
    end
    after do
      File.delete("tmp/rspec_test.json")
    end
  end
  
  describe "fails create" do
    it "rerender" do
      post :create
      response.should render_template("new")
      flash[:message].should == "ファイルを選択してください。"
    end
    
    it "overwrite" do
      post :create, :path => fixture_file_upload("/rspec_test.json",'application/json')
      post :create, :path => fixture_file_upload("/rspec_test.json",'application/json')
      response.should render_template("new")
      flash[:message].should == "指定されたファイルは既に存在しています。"
      File.delete("tmp/rspec_test.json")
    end
  end
end
