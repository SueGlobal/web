require "spec_helper"

describe UniversitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities").should route_to("universities#index")
    end

    it "routes to #new" do
      get("/universities/new").should route_to("universities#new")
    end

    it "routes to #show" do
      get("/universities/1").should route_to("universities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/universities/1/edit").should route_to("universities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities").should route_to("universities#create")
    end

    it "routes to #update" do
      put("/universities/1").should route_to("universities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/universities/1").should route_to("universities#destroy", :id => "1")
    end

  end
end
