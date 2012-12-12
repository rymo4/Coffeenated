class RankingsIndexSerializer < ActiveModel::Serializer
  attributes :id, :brew_method, :data, :overall, :notes, :coffee_name, :roaster_name
  self.root = false

  def coffee_name
    object.coffee_type.name
  end

  def roaster_name
    object.coffee_type.roaster.name
  end
end
