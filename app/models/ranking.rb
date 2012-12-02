class Ranking
  include Mongoid::Document
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

  def as_json options = {}
    super(options).merge(:coffee_type => coffee_type.attributes.merge(roaster_name: coffee_type.roaster.name))
  end

end
