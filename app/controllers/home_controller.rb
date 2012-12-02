class HomeController < ApplicationController
  def index
    @featured_coffee = Ranking.order_by([:overall, :desc]).first.coffee_type
    @featured_roaster = @featured_coffee.roaster
  end
end
