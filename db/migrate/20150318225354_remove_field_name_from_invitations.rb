class RemoveFieldNameFromInvitations < ActiveRecord::Migration
  def change
    remove_column :invitations, :start_location, :string
    
  end
end
