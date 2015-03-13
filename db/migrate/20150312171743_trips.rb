class Trips < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
  		t.string :start_date
  		t.string :end_date
  		t.integer :status
  		t.references :user, index: true

  		t.timestamps null: false
  	end
  end
end
