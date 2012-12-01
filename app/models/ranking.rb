class Ranking
  include Mongoid::Document
  TASTES = %(Dark Sour Bitter Nutty).split.freeze

  field :data, 
    type: Hash, 
    default: TASTES.each_with_object({}) { |k, h| h[k] = 0 }

  belongs_to :coffee_type
  belongs_to :user

  def maps_url
    'http://maps.googleapis.com/maps/api/staticmap?' + {
      center: 'Brooklyn+Bridge,New+York,NY',
      zoom: 13,
      size: '400x400',
      maptype: 'roadmap',
      markers: 'color:blue%7label:S%7C40.702147,-74.015794',
      sensor: 'false'
    }.inject('') {|str, opt| str << '&' << opt.join('=') }
  end

end
