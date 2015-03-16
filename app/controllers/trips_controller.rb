class TripsController < ApplicationController

	def index
		@trips = Trip.all		
	end

	def show
		@trip = Trip.find(params[:id])
		@address = @trip.ski_location.address
		respond_to do |format|
			format.html
			format.json {render :json => @address.to_json}
		end

	end

	def new
		@trip = Trip.new
	end

	def edit

	end

	def create
		@trip = Trip.new(trip_params)
		@user = current_user
		@trip.update(user_id: @user.id)
		@trip.update(status: 'pending')


	end

	def update

	end

	private

	def trip_params
		params.require(:trip).permit(:name, :description, :start_date, :end_date)
	end


end