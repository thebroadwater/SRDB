class LocationSourcesController < ApplicationController
  def create
    @location = Location.find(params[:location_id])
    @location_source = @location.location_sources.create(location_source_params)
    redirect_to location_path(@location)
  end

  def destroy
    @location_source = LocationSource.find(params[:id])
    @location_source.destroy

    redirect_to "/locations/#{params[:location_id]}"
  end

  private
    def location_source_params
      params.require(:location_source).permit(:source_id, :pages, :location_id)
    end
end
