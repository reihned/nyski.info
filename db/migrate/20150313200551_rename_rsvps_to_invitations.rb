class RenameRsvpsToInvitations < ActiveRecord::Migration
  def change
  	rename_table :rsvp, :invitations
  	add_column :invitations, :rsvp, :boolean
  	add_column :invitations, :email, :string
  end
end
