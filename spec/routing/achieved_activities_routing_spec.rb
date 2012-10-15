# -*- encoding : utf-8 -*-
require "spec_helper"

describe AchievedActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/achieved_activities").should route_to("achieved_activities#index", university_id: "1")
    end

    it "routes to #show" do
       get("achieved_activities/1").should route_to("achieved_activities#show", id: "1")
    end

    it "routes to #new" do
      get("/universities/1/achieved_activities/new").should route_to("achieved_activities#new", university_id: "1")
    end

    it "routes to #edit" do
      get("/achieved_activities/1/edit").should route_to("achieved_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/achieved_activities").should route_to("achieved_activities#create", university_id: "1")
    end

    it "routes to #update" do
      put("/achieved_activities/1").should route_to("achieved_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/achieved_activities/1").should route_to("achieved_activities#destroy", :id => "1")
    end

  end
end
