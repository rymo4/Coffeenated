class CoffeeType
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :location, type: String

  belongs_to :roaster
  has_many :rankings

  def maps_url
    GoogleStaticMap.new(
      :zoom => 11,
      :center => MapLocation.new(:address => location)
    ).url(:auto)
  end

end
