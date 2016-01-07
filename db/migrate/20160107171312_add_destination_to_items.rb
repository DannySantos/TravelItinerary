class AddDestinationToItems < ActiveRecord::Migration
  def change
    add_column :items, :destination, :string
  end
end
