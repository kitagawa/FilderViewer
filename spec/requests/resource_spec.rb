# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Resource" do
  describe "index" do
    before do 
      visit resources_path
    end
    
    it "click upload" do
      click_link_or_button "ファイル追加"
      current_path.should == new_resource_path
    end
  end
  
  describe "create" do
    before do
      visit new_resource_path
    end
    it "upload successfuly" do
      attach_file 'path', './spec/fixtures/rspec_test.json'
      click_button "アップロード"
      current_path.should == resources_path
    end
  end
end
