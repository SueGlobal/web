# -*- encoding : utf-8 -*-
require "spec_helper"

describe AgreementSourceStudiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/agreement_source_studies").should route_to("agreement_source_studies#index", university_id: '1')
    end

    it "routes to #new" do
      get("/universities/1/agreement_source_studies/new").should route_to("agreement_source_studies#new", university_id: '1')
    end

    it "routes to #show" do
      get("/agreement_source_studies/1").should route_to("agreement_source_studies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/agreement_source_studies/1/edit").should route_to("agreement_source_studies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/agreement_source_studies").should route_to("agreement_source_studies#create", university_id: '1')
    end

    it "routes to #update" do
      put("/agreement_source_studies/1").should route_to("agreement_source_studies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/agreement_source_studies/1").should route_to("agreement_source_studies#destroy", :id => "1")
    end

  end
end
