# -*- encoding : utf-8 -*-
require "spec_helper"

describe EmployerStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/employer_studies").should route_to("employer_studies#index", university_id: '1')
    end

    it "routes to #new" do
      get("/universities/1/employer_studies/new").should route_to("employer_studies#new", university_id: '1')
    end

    it "routes to #show" do
      get("/employer_studies/1").should route_to("employer_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employer_studies/1/edit").should route_to("employer_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/employer_studies").should route_to("employer_studies#create", university_id: '1')
    end

    it "routes to #update" do
      put("/employer_studies/1").should route_to("employer_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employer_studies/1").should route_to("employer_studies#destroy", :id => "1")
    end

  end
end
