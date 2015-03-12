class SkiLocationsController < ApplicationController
	# before_action :require_something_that_is_admin_login!

	def index
		@ski_locations = Ski_location.all
	end

	def new
		@ski_location = Ski_location.new
	end

	def create
    @ski_location = Ski_location.new(ski_location_params)

    respond_to do |format|
      if @ski_location.save
        format.html { redirect_to @ski_location, notice: 'Ski_location was successfully created.' }
        format.json { render :show, status: :created, location: @ski_location }
      else
        format.html { render :new }
        format.json { render json: @ski_location.errors, status: :unprocessable_entity }
      end
    end
	end

	def edit

	end

  def update
    respond_to do |format|
      if @ski_location.update(user_params)
        format.html { redirect_to @ski_location, notice: 'Ski location was successfully updated.' }
        format.json { render :show, status: :ok, location: @ski_location }
      else
        format.html { render :edit }
        format.json { render json: @ski_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @ski_location.destroy
    respond_to do |format|
      format.html { redirect_to ski_locations_path, notice: 'Location was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def ski_location_params
    params.require(:ski_location).permit(:name, :url, :latitude, :longitude, :address, :category)
  end
end