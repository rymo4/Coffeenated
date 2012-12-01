class CoffeeType
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :location, type: String

  belongs_to :roaster
  has_many :rankings

  def maps_url
    GoogleStaticMap.new(
      :zoom => 12,
      :maptype => "satellite",
      :center => MapLocation.new(:address => location)
    ).url(:auto)
  end

  def as_json options = {}
    super.merge(rankings: rankings, maps_url: maps_url)
  end

end
