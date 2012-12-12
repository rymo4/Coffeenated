class SimilarCoffeeSerializer < ActiveModel::Serializer
  attributes :name, :url, :roaster_name

  def url
    Rails.application.routes.url_helpers.roasters_path(object.roaster).gsub('.', '/')
  end

  def roaster_name
    object.roaster.name
  end
end
