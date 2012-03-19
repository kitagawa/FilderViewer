require 'spec_helper'

describe "canvas/index.html.erb" do
  it "renders a page" do
    render
    rendered.should have_selector("canvas#main")
  end
end