class Ranking
  include Mongoid::Document
  TASTES = %(Dark Sour Bitter Nutty).split.freeze

  field :data, 
    type: Hash, 
    default: TASTES.each_with_object({}) { |k, h| h[k] = 0 }

  belongs_to :coffee_type
  belongs_to :user

end
