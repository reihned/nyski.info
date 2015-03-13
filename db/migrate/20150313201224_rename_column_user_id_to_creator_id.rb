class RenameColumnUserIdToCreatorId < ActiveRecord::Migration
  def change
  	remove_column :trips, :user_id
  	add_column :trips, :creator_id, :integer
  end
end
