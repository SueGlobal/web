require "spec_helper"

describe JournalsController do
  describe "routing" do

    it "routes to #index" do
      get("/journals").should route_to("journals#index")
    end

    it "routes to #new" do
      get("/journals/new").should route_to("journals#new")
    end

    it "routes to #show" do
      get("/journals/1").should route_to("journals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/journals/1/edit").should route_to("journals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/journals").should route_to("journals#create")
    end

    it "routes to #update" do
      put("/journals/1").should route_to("journals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/journals/1").should route_to("journals#destroy", :id => "1")
    end

  end
end
