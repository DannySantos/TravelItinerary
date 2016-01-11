class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.text :description
      t.string :address
      t.string :country
      t.float :latitude
      t.float :longitude
      t.integer :provider_id

      t.timestamps null: false
    end
  end
end
