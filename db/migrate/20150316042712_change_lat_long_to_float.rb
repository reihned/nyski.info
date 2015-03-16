class ChangeLatLongToFloat < ActiveRecord::Migration
  def change
    remove_column :ski_locations, :latitude
    add_column :ski_locations, :latitude, :float
    remove_column :ski_locations, :longitude
    add_column :ski_locations, :longitude, :float
  end
end
