class Property < ActiveRecord::Base
  belongs_to :provider
  validates :description, :address, :country, presence: true

  geocoded_by :geocode_string
  after_validation :geocode

  def self.search_rentals(item)
    @rentals = []
    @properties = Property.where(:country => item.destination)
    @properties.each do |property|
      if Geocoder::Calculations.distance_between(
        [item.latitude, item.longitude], 
        [property.latitude, property.longitude]) < 25
        @rentals << property
      end
    end
    return @rentals
  end

  def geocode_string
    "#{address}, #{country}"
  end
end
