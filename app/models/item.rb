class Item < ActiveRecord::Base
  belongs_to :journey
  validates :description, :destination, :address, presence: true

  geocoded_by :geocode_string
  after_validation :geocode 

  def geocode_string
    "#{destination}, #{address}"
  end
end
