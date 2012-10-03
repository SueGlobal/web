require "spec_helper"

describe ServicesController do
  describe "routing" do

    it "routes to #index" do
      get("/universities/1/services").should route_to("services#index",
                                                      university_id: "1")
    end

    it "routes to #new" do
      get("/universities/1/services/new").should route_to("services#new",
                                                          university_id: "1")
    end

    it "does not route to #show" do
      get("/services/1").should_not route_to("services#show", :id => "1")
    end

    it "routes to #edit" do
      get("/services/1/edit").should route_to("services#edit", :id => "1")
    end

    it "routes to #create" do
      post("/universities/1/services").should route_to("services#create",
                                                       university_id: "1")
    end

    it "routes to #update" do
      put("/services/1").should route_to("services#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/services/1").should route_to("services#destroy", :id => "1")
    end

  end
end
