class InvitationsController < ApplicationController

  before_action :require_login, only: [:create]
  
  def index
    @invitations = current_user.invitations
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @invitations }
    end
  end

  def new
    if !current_user
      redirect_to new_user_path
    else
      @invitation = Invitation.new
    end
  end

  def create
    @invitation = Invitation.new({
      trip_id: params[:invitation][:trip_id].to_i,
      user_id: current_user.id,
      email: current_user.email,
      rsvp: true
    })
    trip = @invitation.trip
    result = {
        id: trip.id,
        name: trip.name,
        description: trip.description,
        ski_location_name: trip.ski_location.name,
        start_date: trip.start_date,
        end_date: trip.end_date,
        invitation: @invitation
      }
    respond_to do |format|
      if @invitation.save
        format.html { redirect_to trips_path, notice: 'Trip done been made.' }
        format.json { render json: result, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @invitation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  # def update
  #   @invitation.update(invite_params)
  #   redirect_to @invitation.event
  # end

  def destroy
    @invitation = Invitation.find(params[:id])
    trip = @invitation.trip
    result = {
      id: trip.id,
      name: trip.name,
      description: trip.description,
      ski_location_name: trip.ski_location.name,
      start_date: trip.start_date,
      end_date: trip.end_date,
      invitation: nil
    }
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Welcome to the Trip.' }
      format.json { render json: result }
    end
  end

  private
  
  def set_invite
    @invitation = Invitation.find(params[:id])
  end

  def invite_params
    params.require(:invitation).permit(:user_id, :event_id, :rsvp, :email, :start_location)
  end
end