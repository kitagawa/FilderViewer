# -*- encoding : utf-8 -*-
class LoginController < ApplicationController
  #skip_before_filter :block_non_user
  
  #ログイン画面
  def index
    #初期化
    session[:user] = nil
  end
  
  #ログイン
  def login
    user = User.authenticate(params[:address], params[:password])
    if user
      session[:user] = user.address
      redirect_to resources_path
    else
      flash.now[:message] = "アドレスまたはパスワードが間違っています。"
      render :action => "index"
    end
  end
  
  #ログアウト
  def logout
    session[:user] = nil
    redirect_to resources_path
  end
end
