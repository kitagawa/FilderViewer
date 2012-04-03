# -*- encoding : utf-8 -*-
class ResourcesController < ApplicationController
 include ApplicationHelper
 
  def index
    @files = []
    Dir.glob(user_directory + '/*.{json}') do |file|
      @files << file
    end
  end
  
  def new
    
  end
  
  def create
    if params[:path]
      file = params[:path]
      filename = file.original_filename
      new_path = user_directory + "/" +filename
      
      if File.exist?(new_path)
        flash[:message] = "指定されたファイルは既に存在しています。"
        render "new"
        return
      end
      begin
        io = File.open(new_path,"w")
        io.write(file.read)
        io.close
        flash[:notice] = "ファイルのアップロードを行いました。"
        redirect_to resources_path
      rescue
        flash[:message] = "ディレクトリが見つかりません。"
        render "new"
      end
    else
      flash[:message] = "ファイルを選択してください。"
      render "new"
    end
  end
  
end
