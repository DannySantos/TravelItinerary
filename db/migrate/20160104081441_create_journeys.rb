class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|

      t.timestamps null: false
    end
  end
end
