class CanvasController < ApplicationController
  def index
    if params[:path]
      begin
        file = File.open(params[:path],"r")
        @json = file.read if file
        file.close
      rescue
        flash[:message] = "File not found!"
      end
    end
  end
  def draw
    @json = File.open("tmp/test.json","r").read
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
end
