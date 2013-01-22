require "spec_helper"

describe AnnualReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/annual_reports").should route_to("annual_reports#index")
    end

    it "routes to #new" do
      get("/annual_reports/new").should route_to("annual_reports#new")
    end

    it "routes to #show" do
      get("/annual_reports/1").should route_to("annual_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/annual_reports/1/edit").should route_to("annual_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/annual_reports").should route_to("annual_reports#create")
    end

    it "routes to #update" do
      put("/annual_reports/1").should route_to("annual_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/annual_reports/1").should route_to("annual_reports#destroy", :id => "1")
    end

  end
end
