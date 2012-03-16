# -*- encoding : utf-8 -*-
require "spec_helper"
describe "routing" do
  describe LoginController do
    it "routes to #index" do
      get("/login").should route_to("login#index")
    end
    
    it "routes to #login" do
      post("/login/login").should route_to("login#login")
    end
    
    it "routes to #logout" do
      get("/login/logout").should route_to("login#logout")
    end
  end
end