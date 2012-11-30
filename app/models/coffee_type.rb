class CoffeeType
  include Mongoid::Document
  field :name, type: String
  belongs_to :roaster
  has_many :rankings
end
