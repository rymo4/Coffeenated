class Roaster
  include Mongoid::Document
  field :name, type: String
  has_many :coffee_types

  def as_json options = {}
    super.merge coffee_types: coffee_types
  end
end
