class Rsvp < ActiveRecord::Migration
  def change
  	create_table :rsvp do |t|
  		t.references :user
  		t.references :trip
  		t.string :start_location
  		t.boolean :accepted, default: false

  		t.timestamps null: false
  	end
  end
end
