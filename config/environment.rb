# -*- encoding : utf-8 -*-
# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
FilderViewer::Application.initialize!

#ファイルの保存場所
FILE_DIRECTORY = "./tmp"