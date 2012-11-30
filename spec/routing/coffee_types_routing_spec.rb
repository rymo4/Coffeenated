require "spec_helper"

describe CoffeeTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/coffee_types").should route_to("coffee_types#index")
    end

    it "routes to #new" do
      get("/coffee_types/new").should route_to("coffee_types#new")
    end

    it "routes to #show" do
      get("/coffee_types/1").should route_to("coffee_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/coffee_types/1/edit").should route_to("coffee_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/coffee_types").should route_to("coffee_types#create")
    end

    it "routes to #update" do
      put("/coffee_types/1").should route_to("coffee_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/coffee_types/1").should route_to("coffee_types#destroy", :id => "1")
    end

  end
end
