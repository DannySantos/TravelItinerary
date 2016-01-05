class AddUserNameToTravellers < ActiveRecord::Migration
  def change
    add_column :travellers, :username, :string
  end
end
