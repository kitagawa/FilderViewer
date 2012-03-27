require 'spec_helper'

describe "canvas/index.html.erb" do
  it "renders a page" do
    render
    rendered.should have_selector("canvas#main")
  end
  
  it "show error message" do
    flash[:message] = "alert"
    render
    rendered.should have_selector("div.alert")
    rendered.should =~ /alert/
  end
end