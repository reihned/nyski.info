class TripsController < ApplicationController

	def index
		@trips = Trip.all
		@invitation = Invitation.find_by_user_id(current_user.id)
	end

	def show
		@trip = Trip.find(params[:id])
		address = @trip.ski_location.address
		respond_to do |format|
			format.html
			format.json {render :json => address.to_json}
		end

	end

	def new
		if !current_user
			redirect_to new_user_path
		else
			@trip = Trip.new
		end
	end

	def edit

	end

	def create
		@trip = Trip.new(trip_params)
		@user = current_user
		respond_to do |format|
			if @trip.update(creator_id: @user.id) && @trip.update(status: 'pending')
					format.html { redirect_to @trip, notice: 'Trip done been made.' }
    		format.json { render :show, status: :ok, location: @trip }
  		else
    		format.html { render :edit }
    		format.json { render json: @trip.errors, status: :unprocessable_entity }
  		end
		end
	end

	def update

	end

	private

	def trip_params
		params.require(:trip).permit(:name, :description, :ski_location_id, :start_date, :end_date)
	end


end