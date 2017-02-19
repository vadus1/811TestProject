class LocationsController < ApplicationController
  before_action :find_location, only: [:show, :edit, :update]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to locations_path, flash: { success: 'Location was successfully created' }
    else
      flash[:error] = 'Please draw an area on the map'
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to location_path(@location), flash: { success: 'Location was successfully updated' }
    else
      render :edit
    end
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :area)
  end
end
