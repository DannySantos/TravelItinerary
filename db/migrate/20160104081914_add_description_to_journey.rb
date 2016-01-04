class AddDescriptionToJourney < ActiveRecord::Migration
  def change
    add_column :journeys, :description, :text
  end
end
