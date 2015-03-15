class SearchController < ActionController::Base
# class SearchController < ApplicationController

  def new
    # GET new search

  end

  def create
    # GET show results based off search
    binding.pry
    render :new
  end

end
