# -*- encoding : utf-8 -*-
require "spec_helper"

describe OtherStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/other_studies").should route_to("other_studies#index", university_id: '1')
    end

    it "routes to #new" do
      get("/universities/1/other_studies/new").should route_to("other_studies#new", university_id: '1')
    end

    it "routes to #show" do
      get("/other_studies/1").should route_to("other_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/other_studies/1/edit").should route_to("other_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/other_studies").should route_to("other_studies#create", university_id: '1')
    end

    it "routes to #update" do
      put("/other_studies/1").should route_to("other_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/other_studies/1").should route_to("other_studies#destroy", :id => "1")
    end

  end
end
