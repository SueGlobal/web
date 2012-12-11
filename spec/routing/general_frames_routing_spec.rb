# -*- encoding : utf-8 -*-
require "spec_helper"

describe GeneralFramesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/general_frames").should route_to("general_frames#index", university_id: "1")
    end

    it "routes to #new" do
      get("/universities/1/general_frames/new").should route_to("general_frames#new", university_id: "1")
    end

    it "routes to #show" do
      get("/general_frames/1").should route_to("general_frames#show", :id => "1")
    end

    it "routes to #edit" do
      get("/general_frames/1/edit").should route_to("general_frames#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/general_frames").should route_to("general_frames#create", university_id: "1")
    end

    it "routes to #update" do
      put("/general_frames/1").should route_to("general_frames#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/general_frames/1").should route_to("general_frames#destroy", :id => "1")
    end

    it "routes to #evolution" do
      expect(get("/universities/1/general_frames/evolution")).to route_to("general_frames#evolution", university_id: "1")
    end
  end
end
