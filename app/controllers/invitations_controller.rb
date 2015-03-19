class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]
  
  def index
    @invitations = current_user.invitations
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @invitations }
    end
  end

  def show
    @invitation = Invitation.find(params[:id])
  end

  def update
    @invitation.update(invite_params)
    redirect_to @invitation.event
  end

  def destroy
  end

  private
  
  def set_invite
    @invitation = Invitation.find(params[:id])
  end

  def invite_params
    params.require(:invitation).permit(:user_id, :event_id, :rsvp, :email, :start_location)
  end
end