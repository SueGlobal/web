# -*- encoding : utf-8 -*-
require "spec_helper"

describe IndicesController do
  describe "routing" do

    it "routes to #index" do
      get("/indices").should route_to("indices#index")
    end

    it "routes to #new" do
      get("/indices/new").should route_to("indices#new")
    end

    it "routes to #show" do
      get("/indices/1").should route_to("indices#show", :id => "1")
    end

    it "routes to #edit" do
      get("/indices/1/edit").should route_to("indices#edit", :id => "1")
    end

    it "routes to #create" do
      post("/indices").should route_to("indices#create")
    end

    it "routes to #update" do
      put("/indices/1").should route_to("indices#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/indices/1").should route_to("indices#destroy", :id => "1")
    end

  end
end
