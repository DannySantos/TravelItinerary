class Journey < ActiveRecord::Base

  has_one :traveller
  belongs_to :traveller

  validates :title, presence: true
  validates :description, presence: true
end
