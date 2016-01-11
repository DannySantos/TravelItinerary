class AddTypeToTravellers < ActiveRecord::Migration
  def change
    add_column :travellers, :type, :string
  end
end
