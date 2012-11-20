# -*- encoding : utf-8 -*-
require "spec_helper"

describe SegmentationVariablesController do
  describe "routing" do

    it "routes to #index" do
      get("/segmentation_variables").should route_to("segmentation_variables#index")
    end

    it "routes to #new" do
      get("/segmentation_variables/new").should route_to("segmentation_variables#new")
    end

    it "routes to #show" do
      get("/segmentation_variables/1").should route_to("segmentation_variables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/segmentation_variables/1/edit").should route_to("segmentation_variables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/segmentation_variables").should route_to("segmentation_variables#create")
    end

    it "routes to #update" do
      put("/segmentation_variables/1").should route_to("segmentation_variables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/segmentation_variables/1").should route_to("segmentation_variables#destroy", :id => "1")
    end

  end
end
