# -*- encoding : utf-8 -*-
require 'spec_helper'
describe UsersController do
  def valid_attributes
    {:name => "test",
      :password => "password",
      :password_confirmation => "password"}
  end

  describe "GET new" do
    it "assigns a new user as @user" do
      get :new
      assigns(:user).should be_a_new(User)
    end
  end

  describe "POST create" do
      it "creates a new User" do
        expect {
          post :create, :user => valid_attributes
        }.to change(User, :count).by(1)
      end

    describe "with valid params" do
      before do
        post :create, :user => valid_attributes
      end
      
      it "assigns a newly created user as @user" do
        assigns(:user).should be_a(User)
        assigns(:user).should be_persisted
      end

      it "redirects to the created user" do
        response.should redirect_to(login_index_path)
      end
      
      it "created directory" do
         File::ftype(FILE_DIRECTORY + "/test/").should == "directory"
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        assigns(:user).should be_a_new(User)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        post :create, :user => {}
        response.should render_template("new")
      end
    end
  end
end
