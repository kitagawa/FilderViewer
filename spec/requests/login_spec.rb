# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Login" do
  describe "GET /index" do
    before do 
      visit login_index_path
    end
    it "login" do
      @user = Factory.create(:user)
      fill_in "name", :with => @user.name
      fill_in "password", :with => @user.password
      click_button "ログイン"
      current_path.should == canvas_path
    end
    
    it "fail login" do
      click_button "ログイン"
      have_content "アドレスまたはパスワードが間違っています。"
    end
    
    it "redirect to new user" do
      click_link "ユーザー登録"
      current_path.should == new_user_path
    end
  end
end
