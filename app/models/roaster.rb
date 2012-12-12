class Roaster
  include Mongoid::Document
  field :name, type: String
  field :url, type: String
  field :image_url, type: String
  has_many :coffee_types

  validates :image_url, presence: true
  validates :url, presence: true
  validates :name, presence: true

  def average_rating
    ranks = coffee_types.map { |c| c.rankings.map(&:overall) }.flatten
    avg = ranks.inject(&:+).to_f / ranks.count
    "%.2f" % avg
  end

  def active_model_serializer
    RoasterSerializer
  end

end
