# -*- encoding : utf-8 -*-
require "spec_helper"
describe "routing" do
  describe CanvasController do
    it "routes to #index" do
      get("canvas").should route_to("canvas#index")
    end
    it "routes to #draw" do
      get("canvas/draw").should route_to("canvas#draw")
    end
  end
end