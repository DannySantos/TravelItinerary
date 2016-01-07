class AddJourneyIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :journey_id, :integer
  end
end
