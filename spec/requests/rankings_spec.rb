require 'spec_helper'

describe "Rankings" do
  describe "GET /rankings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get rankings_path
      response.status.should be(200)
    end
  end
end
