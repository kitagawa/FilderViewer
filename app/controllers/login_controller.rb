# -*- encoding : utf-8 -*-
class LoginController < ApplicationController
  skip_before_filter :block_unsigned_user

  #ログイン画面
  def index
  end
  
  #ログイン
  def login
    user = User.authenticate(params[:name], params[:password])
    if user
      session[:user] = user.name
      redirect_to canvas_path
    else
      flash.now[:message] = "アドレスまたはパスワードが間違っています。"
      render :action => "index"
    end
  end
  
  #ログアウト
  def logout
    reset_session
    redirect_to login_index_path
  end
end
