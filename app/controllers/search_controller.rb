# class SearchController < ActionController::Base
class SearchController < ApplicationController

  def index
  end

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
    render :index
  end

  def show
    @trip = Trip.new({ski_location_id: params[:id]})
    if current_user
      render 'trips/new'
      session[:search_id] = nil
    else
      session[:search_id] = params[:id]
      redirect_to new_user_path
    end
  end

end
