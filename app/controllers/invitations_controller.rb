class InvitationsController < ApplicationController
	
	def new
		if !current_user
			redirect_to new_user_path
		else
			@invitation = Invatition.new
		end
	end
	
	def create
		invitation = Invitation.new(invitation_params)
		Pry.start(binding)
		@user = current_user
		respond_to do |format|
			if invitation.update({
				email: @user.email, 
				rsvp: true, 
				user_id: @user.id
				})
				format.html { redirect_to trips_path, notice: 'Trip added to your profile' }
				format.json { render :json => address.to_json }
			else
				format.html { redirect_to current_user }
				format.json do
					render :json => { 
					invitation: {
							errors: invitation.errors.full_messages
						} 
					}
				end
			end
		end
	end

	def destroy
	end

	private

	def invitation_params
		params.require(:invitation).permit(:user_id, :trip_id, :rsvp, :email, :start_location)
	end

end
