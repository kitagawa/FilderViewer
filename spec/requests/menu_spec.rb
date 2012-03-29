require 'spec_helper'
describe "menu" do
  before do
    visit "/"
  end
  it "click list" do
    click_link "List"
    current_path.should == resources_path
  end
end
