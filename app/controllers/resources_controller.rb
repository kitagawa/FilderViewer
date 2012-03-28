# -*- encoding : utf-8 -*-
class ResourcesController < ApplicationController
 
  def index
    @files = []
    Dir.glob(FILE_DIRECTORY + '/*.{json}') do |file|
      @files << file
    end
  end
  
  def new
    
  end
  
  def create
    if params[:path]
      file = params[:path]
      filename = file.original_filename
      new_path = FILE_DIRECTORY + "/" +filename
      if File.exist?(new_path)
        flash[:message] = "指定されたファイルは既に存在しています。"
        render "new"
        return
      end
      io = File.open(new_path,"w")
      io.write(file.read)
      io.close
      flash[:notice] = "ファイルのアップロードを行いました。"
      redirect_to resources_path
    else
      flash[:message] = "ファイルを選択してください。"
      render "new"
    end
  end
  
end
