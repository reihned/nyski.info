class TripsController < ApplicationController

	def index
		@trips = Trip.all		
	end

	def show

	end

	def new
		@trip = Trip.new
	end

	def edit

	end

	def create

	end

	def update

	end


end