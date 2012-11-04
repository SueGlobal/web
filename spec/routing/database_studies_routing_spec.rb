# -*- encoding : utf-8 -*-
require "spec_helper"

describe DatabaseStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/database_studies").should route_to("database_studies#index", university_id: "1")
    end

    it "routes to #new" do
      get("/universities/1/database_studies/new").should route_to("database_studies#new", university_id: "1")
    end

    it "routes to #show" do
      get("/database_studies/1").should route_to("database_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/database_studies/1/edit").should route_to("database_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/database_studies").should route_to("database_studies#create", university_id: "1")
    end

    it "routes to #update" do
      put("/database_studies/1").should route_to("database_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/database_studies/1").should route_to("database_studies#destroy", :id => "1")
    end

  end
end
