# -*- encoding : utf-8 -*-
require 'spec_helper'

describe "Canvas" do
  describe "logout" do
    it "logout successfully" do
      visit canvas_path
      click_link "ログアウト"
      current_path.should == login_index_path
    end
  end

end
