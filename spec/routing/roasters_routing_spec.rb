require "spec_helper"

describe RoastersController do
  describe "routing" do

    it "routes to #index" do
      get("/roasters").should route_to("roasters#index")
    end

    it "routes to #new" do
      get("/roasters/new").should route_to("roasters#new")
    end

    it "routes to #show" do
      get("/roasters/1").should route_to("roasters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/roasters/1/edit").should route_to("roasters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/roasters").should route_to("roasters#create")
    end

    it "routes to #update" do
      put("/roasters/1").should route_to("roasters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/roasters/1").should route_to("roasters#destroy", :id => "1")
    end

  end
end
