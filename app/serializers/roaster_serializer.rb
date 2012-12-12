class RoasterSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :image_url
  has_many :coffee_types, serializer: RoastersCoffeeTypeSerializer
  self.root = false

end
