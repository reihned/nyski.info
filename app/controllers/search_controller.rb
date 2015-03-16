# class SearchController < ActionController::Base
class SearchController < ApplicationController

  def new
    # GET new search

  end

  def create
    # GET show results based off search
    # {"utf8"=>"✓",
    # "authenticity_token"=>nil,
    # "origin"=>"11201",
    # "search"=>{"range"=>"200"},
    # "commit"=>"Search",
    # "controller"=>"search",
    # "action"=>"create"}
    start = Location.new(address: params["origin"])
    @currentRange = params["search"]["range"].to_i
    @skiLocations = SkiLocation.within(@currentRange, :origin => start)
    render :new
  end

  def show
    @trip = Trip.new({ski_location_id: params[:id]})
    render 'trips/new'
  end

end
