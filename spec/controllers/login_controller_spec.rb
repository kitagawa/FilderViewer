# -*- encoding : utf-8 -*-
require 'spec_helper'

describe LoginController do
  describe "GET index" do  
    before do
      session[:user] = "test"
      get :index
    end
    it "render successfully" do
      response.should be_success
    end
    it "reset user session" do
      session[:user].should == nil
    end
  end
  
  describe "PUT login" do
    it "ログイン成功" do
      @user = Factory.create(:user)
      put :login, {:name => @user.name, :password => @user.password}
      response.should redirect_to(canvas_path)
    end
    it "ログイン失敗" do
      put :login, {}
      response.should render_template("index")
    end
  end
end
