class AddDescriptionToSkiLocations < ActiveRecord::Migration
  def change
    add_column :ski_locations, :description, :text
  end
end
