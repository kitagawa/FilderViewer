class CanvasController < ApplicationController
  def index
    @json = File.open("tmp/test.json","r").read
  end
  def draw
    @json = File.open("tmp/test.json","r").read
    respond_to do |format|
      format.html # new.html.erb
      format.js
    end
  end
end
