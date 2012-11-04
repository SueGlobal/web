# -*- encoding : utf-8 -*-
require "spec_helper"

describe PublicSourceStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/public_source_studies").should route_to("public_source_studies#index", university_id: "1")
    end

    it "routes to #new" do
      get("/universities/1/public_source_studies/new").should route_to("public_source_studies#new", university_id: "1")
    end

    it "routes to #show" do
      get("/public_source_studies/1").should route_to("public_source_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/public_source_studies/1/edit").should route_to("public_source_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/public_source_studies").should route_to("public_source_studies#create", university_id: "1")
    end

    it "routes to #update" do
      put("/public_source_studies/1").should route_to("public_source_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/public_source_studies/1").should route_to("public_source_studies#destroy", :id => "1")
    end

  end
end
