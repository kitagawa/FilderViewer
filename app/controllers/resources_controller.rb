class ResourcesController < ApplicationController
 
  def index
    @files = []
    Dir.glob('./tmp/*.{json}') do |file|
      @files << file
    end
  end
end
