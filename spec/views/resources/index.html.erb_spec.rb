# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "resources/index.html.erb" do
  before do
    @files = []
  end
  it "show notice" do    
    flash[:notice] = "ファイルのアップロードを行いまいました。"
    render
    rendered.should have_selector("div.alert-success")
    rendered.should =~ /ファイルのアップロードを行いまいました。/    
  end
end