# -*- encoding : utf-8 -*-
require "spec_helper"

describe SegmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/segmentation_variables/1/segments").should_not be_routable
    end

    it "routes to #new" do
      get("/segmentation_variables/1/segments/new").should route_to("segments#new", segmentation_variable_id: '1')
    end

    it "routes to #show" do
      get("/segmentation_variables/1/segments/1").should_not be_routable
    end

    it "routes to #edit" do
      get("/segmentation_variables/1/segments/1/edit").should_not be_routable
    end

    it "routes to #create" do
      post("/segmentation_variables/1/segments").should route_to("segments#create", segmentation_variable_id: '1')
    end

    it "routes to #update" do
      put("/segmentation_variables/1/segments/1").should_not be_routable
    end

    it "routes to #destroy" do
      delete("/segmentation_variables/1/segments/1").should_not be_routable
    end

  end
end
