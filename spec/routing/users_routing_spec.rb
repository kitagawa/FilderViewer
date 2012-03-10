# -*- encoding : utf-8 -*-
require "spec_helper"

describe "routing" do
  describe UsersController do
    it "routes to #index" do
      get("/users").should route_to("users#index")
    end

    it "routes to #new" do
      get("/users/new").should route_to("users#new")
    end

    it "routes to #show" do
      get("/users/1").should route_to("users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/users/1/edit").should route_to("users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/users").should route_to("users#create")
    end

    it "routes to #update" do
      put("/users/1").should route_to("users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/users/1").should route_to("users#destroy", :id => "1")
    end
  end
  
  describe LoginController do
    it "routes to #index" do
      get("/login").should route_to("login#index")
    end
    
    it "routes to #login" do
      put("/login/login").should route_to("login#login")
    end
    
    it "routes to #logout" do
      get("/login/logout").should route_to("login#logout")
    end
  end
end
