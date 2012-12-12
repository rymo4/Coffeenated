class Ranking
  include Mongoid::Document
  include Mongoid::Timestamps

  before_create :update_coffee_average

  TASTES = %(Dark Sour Bitter Nutty Sweet Salty Floural Smokey Fruity).split.freeze
  BREW_METHODS = ['Pourover', 'Expresso', 'Drip', 'Instant', 'Percolator', 'French Press', 'Cold Brew'].freeze

  field :data, 
    type: Hash, 
    default: TASTES.each_with_object({}) { |k, h| h[k] = 0 }

  field :notes, type: String
  field :overall, type: Integer, default: 0
  field :brew_method, type: String

  belongs_to :coffee_type
  belongs_to :user

  validates :overall, presence: true
  validates :brew_method, presence: true
  validates :coffee_type, presence: true

  # before_create
  def update_coffee_average
    ranks = coffee_type.num_rankings
    avg = coffee_type.average_rankings.merge(data) { |k, avg_v, new_v|
      ((avg_v * ranks) + new_v).to_f / (ranks + 1)
    }
    avg_overall = ((coffee_type.average_overall * ranks).to_f + overall).to_f / (ranks + 1)
    coffee_type.update_attributes average_rankings: avg, num_rankings: ranks + 1, average_overall: avg_overall
  end

end
