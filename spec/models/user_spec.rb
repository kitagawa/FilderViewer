# -*- encoding : utf-8 -*-
require 'spec_helper'

describe User do
  context "validationチェック" do
    before do
      @user = Factory.build(:user)
    end
    it{@user.should be_valid}
    
    it "nameがない場合" do
      @user.name = nil
      @user.should be_invalid
    end
    
    it "passwordがない場合" do
      @user.password = nil
      @user.should be_invalid
    end
    
    it "password確認があっていない場合" do
      @user.password_confirmation = "error"
      @user.should be_invalid
    end
  end
  
  context "認証" do
    it "成功" do
      @user = Factory.create(:user)
      User.authenticate(@user.name,@user.password).should == @user
    end
    it "失敗" do
      @user = Factory.build(:user)
      User.authenticate(@user.name,@user.password).should be_nil
    end
  end
end
