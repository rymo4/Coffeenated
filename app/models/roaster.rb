class Roaster
  include Mongoid::Document
  field :name, type: String
  has_many :coffee_types
end
