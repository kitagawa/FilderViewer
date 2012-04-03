# -*- encoding : utf-8 -*-
class UsersController < ApplicationController
  skip_before_filter :block_unsigned_user
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @without_menu = true
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])
    @without_menu = true
    respond_to do |format|
      if @user.save
        #アカウントのディレクトリ作成
        if File::ftype(FILE_DIRECTORY + "/" + @user.name) != "directory"
          Dir::mkdir(FILE_DIRECTORY + "/" + @user.name)
        end
        format.html { redirect_to login_index_path, notice: 'ユーザーを作成しました。' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
