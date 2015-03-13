class AddColumnsToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :name, :string
    add_column :trips, :description, :text
    add_reference :trips, :ski_location, index: true
    add_foreign_key :trips, :ski_locations
  end
end
