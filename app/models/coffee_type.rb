class CoffeeType
  include Mongoid::Document
  field :name, type: String
  field :roaster_id, type: Integer
end
