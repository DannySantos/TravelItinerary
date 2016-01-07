class Journey < ActiveRecord::Base

  belongs_to :traveller
  has_many :items

  validates :title, presence: true
  validates :description, presence: true
end
