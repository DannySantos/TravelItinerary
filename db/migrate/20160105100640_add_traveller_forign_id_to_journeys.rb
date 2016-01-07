class AddTravellerForignIdToJourneys < ActiveRecord::Migration
  def change
    add_column :journeys, :traveller_id, :integer
  end
end
