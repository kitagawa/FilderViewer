# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :block_unsigned_user unless Rails.env == 'test'
  
  def block_unsigned_user
    redirect_to login_index_path unless session[:user] 
  end
end
