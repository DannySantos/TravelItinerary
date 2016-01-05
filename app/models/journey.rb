class Journey < ActiveRecord::Base

  has_one :traveller
  belongs_to :traveller
  has_many :items

  validates :title, presence: true
  validates :description, presence: true
end
