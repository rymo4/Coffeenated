require "spec_helper"

describe RankingsController do
  describe "routing" do

    it "routes to #index" do
      get("/rankings").should route_to("rankings#index")
    end

    it "routes to #new" do
      get("/rankings/new").should route_to("rankings#new")
    end

    it "routes to #show" do
      get("/rankings/1").should route_to("rankings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rankings/1/edit").should route_to("rankings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rankings").should route_to("rankings#create")
    end

    it "routes to #update" do
      put("/rankings/1").should route_to("rankings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rankings/1").should route_to("rankings#destroy", :id => "1")
    end

  end
end
