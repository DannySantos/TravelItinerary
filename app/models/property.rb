class Property < ActiveRecord::Base
  belongs_to :provider
  validates :description, :address, :country, presence: true

  geocoded_by :geocode_string
  after_validation :geocode

  def geocode_string
    "#{address}, #{country}"
  end
end
