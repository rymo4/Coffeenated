class CoffeeType
  include Mongoid::Document
  field :name, type: String

  belongs_to :roaster
  has_many :rankings

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
