class SearchController < ActionController::Base
# class SearchController < ApplicationController

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
    searchRange = params["search"]["range"]
    @skiLocations = SkiLocation.within(searchRange, :origin => start)
    render :new
  end
end
