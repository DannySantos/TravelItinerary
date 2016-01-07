class Item < ActiveRecord::Base
  belongs_to :journey

  validates :description, :destination, presence: true
end
