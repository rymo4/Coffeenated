class CoffeeType
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :location, type: String
  field :num_rankings, type: Integer

  field :average_rankings, type: Hash
  field :average_overall, type: Float, default: 0.0

  belongs_to :roaster
  has_many :rankings

  validate :description, required: true
  validate :location, required: true
  validate :name, required: true

  def maps_url
    map_location = MapLocation.new(:address => location)
    map = GoogleStaticMap.new(
      :zoom => 7,
      :maptype => "hybrid",
      :center => map_location,
      :format => "gif"
    )
    map.markers << MapMarker.new(:color => "red", :location => map_location)
    map.url(:auto)
  end

  # Updates old records with expensive computation
  def update_average!
    avg = Hash.new(0)
    ranks = rankings
    overall_sum = 0.0
    ranks.all.each do |rank|
      avg.merge!(rank.data) { |key, v1, v2| v1 + v2 }
      overall_sum += rank.overall
    end
    avg.merge!(avg) { |k, v| v.to_f / ranks.count }
    avg_overall = overall_sum.to_f / ranks.count
    avg_overall = avg_overall.nan? ? 0.0 : avg_overall
    update_attribute :average_rankings, avg
    update_attribute :num_rankings, ranks.count
    update_attribute :average_overall, avg_overall
    avg
  end


  def as_json options = {}
    super.merge(maps_url: maps_url, similar_coffee: most_similar_coffee.name)
  end

  def average_rating
    rankings.map(&:overall).inject(&:+) / rankings.count
  end

  def difference other
    return 9999 if self == other
    diff = 0
    other_data = other.average_rankings
    average_rankings.each do |k, v|
      diff += v - (other_data[k] || 0)
    end
    diff
  end

  def similar_coffees num = nil
    matches = CoffeeType.all.sort_by { |c| self.difference(c) }[1..-1]
    num ? matches.take(num) : matches
  end

  def most_similar_coffee
    similar_coffees(1).first
  end

end
