class AddStartAndEndDateToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :start_date, :datetime
    add_column :journeys, :end_date, :datetime
  end
end
