# -*- encoding : utf-8 -*-
require "spec_helper"

describe StudentStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/student_studies").should route_to("student_studies#index", university_id: "1")
    end

    it "routes to #new" do
      get("/universities/1/student_studies/new").should route_to("student_studies#new", university_id: "1")
    end

    it "routes to #show" do
      get("/student_studies/1").should route_to("student_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_studies/1/edit").should route_to("student_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/student_studies").should route_to("student_studies#create", university_id: "1")
    end

    it "routes to #update" do
      put("/student_studies/1").should route_to("student_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_studies/1").should route_to("student_studies#destroy", :id => "1")
    end

  end
end
