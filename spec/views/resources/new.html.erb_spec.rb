# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "resources/new.html.erb" do
  before do
    @files = []
  end
  it "show error" do    
    flash[:message] = "ファイルを選択してください。"
    render
    rendered.should have_selector("div.alert")
    rendered.should =~ /ファイルを選択してください。/    
  end
end