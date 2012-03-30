# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Users" do
  describe "new users" do
    before do
      visit new_user_path
    end
    it "create user" do
      fill_in "user_name", :with => "capybara"
      fill_in "user_password", :with => "password"
      fill_in "user_password_confirmation", :with => "password"
      click_link_or_button "登録"
      current_path.should == login_index_path
      page.should have_content 'ユーザーを作成しました。'
    end
    
    describe "fail_create_user" do
      it "fill blank" do
        click_link_or_button "登録"
        page.should have_content "ユーザー名 を入力してください。"
        page.should have_content "パスワード は8文字以上で入力してください。"
      end
      it "fill wrong password" do
        fill_in "user_name", :with => "capybara"
        fill_in "user_password", :with => "password"
        fill_in "user_password_confirmation", :with => "ss"
        click_link_or_button "登録"
        page.should have_content "パスワード が一致しません。"
      end
      it "fill used_username" do
        Factory.create(:user,:name => "test")
        fill_in "user_name", :with => "test"
        click_link_or_button "登録"
        page.should have_content "ユーザー名 はすでに存在します。"
      end
    end
    
    it "canncel" do
      click_link "キャンセル"
      current_path.should == login_index_path
    end
  end
end
