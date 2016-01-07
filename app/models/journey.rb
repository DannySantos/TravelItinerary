class Journey < ActiveRecord::Base

  belongs_to :traveller
  has_many :items

  validates  :start_date, :end_date, :description, :title, presence: true
  validate :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if start_date != nil && end_date != nil
      if end_date < start_date
      errors.add(:end_date, "can't be set before the start date")
      end
    end
  end
end
