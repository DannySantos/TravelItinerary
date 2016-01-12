class AddOmniauthToTravellers < ActiveRecord::Migration
  def change
    add_column :travellers, :provider, :string
    add_index :travellers, :provider
    add_column :travellers, :uid, :string
    add_index :travellers, :uid
  end
end
