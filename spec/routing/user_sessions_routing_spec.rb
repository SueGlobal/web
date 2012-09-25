# -*- encoding : utf-8 -*-
require "spec_helper"

describe UsersController do
  describe "routing" do

    it "routes to #new" do
      get("/login").should route_to("user_sessions#new")
    end

    it "routes to #new" do
      post("/user_sessions").should route_to("user_sessions#create")
    end

    it "routes to #destroy" do
      get("/logout").should route_to("user_sessions#destroy")
    end
  end
end
