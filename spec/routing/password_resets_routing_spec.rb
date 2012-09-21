require "spec_helper"

describe PasswordResetsController do
  describe "routing" do

    it "routes to #create" do
      post("/password_resets").should route_to("password_resets#create")
    end

    it "routes to #edit" do
      get("/password_resets/token/edit").should route_to("password_resets#edit", id: "token")
    end

    it "routes to #update" do
      put("/password_resets/token").should route_to("password_resets#update", id: "token")
    end
  end
end
