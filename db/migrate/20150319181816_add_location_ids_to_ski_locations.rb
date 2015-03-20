class AddLocationIdsToSkiLocations < ActiveRecord::Migration
  def change
    add_column :ski_locations, :report_id, :integer
  end
end
