class CanvasController < ApplicationController
  def index
    
  end
  
  def draw
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
end
