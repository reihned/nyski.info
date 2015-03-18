class RemoveAcceptedFromInvitations < ActiveRecord::Migration
  def change
  		remove_column :invitations, :accepted
  end
end
