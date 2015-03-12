class AddSkiLocationsTable < ActiveRecord::Migration
  def change
  	create_table :ski_locations do |t|
  		t.string :name
  		t.string :address
  		t.string :url
  		t.string :longitude
  		t.string :latitude
  		t.string :type

  		t.timestamps null: false
  	end
  end
end
