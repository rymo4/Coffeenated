class Roaster
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :image_url, type: String
  has_many :coffee_types

  validate :name, required: true
  validate :url, required: true
  validate :image_url, required: true

  def as_json options = {}
    super.merge coffee_types: coffee_types
  end

  def average_rating
    ranks = coffee_types.map { |c| c.rankings.map(&:overall) }.flatten
    avg = ranks.inject(&:+).to_f / ranks.count
    "%.2f" % avg
  end

end
