class RoastersCoffeeTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :average_overall, :average_rankings, :maps_url, :location, :similar_coffee, :num_rankings

  has_one :similar_coffee, key: :similar_coffee, serializer: SimilarCoffeeSerializer

  def average_overall
    "%.2f" % object.average_overall
  end

  def similar_coffee
    object.similar_coffees(1).first
  end

end
