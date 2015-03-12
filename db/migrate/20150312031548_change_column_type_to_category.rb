class ChangeColumnTypeToCategory < ActiveRecord::Migration
  def change
  	change_table :ski_locations do |t|
  		t.rename :type, :category
  	end
  end
end
