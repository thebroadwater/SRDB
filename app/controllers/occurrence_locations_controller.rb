class OccurrenceLocationsController < ApplicationController
  def create
    @occurrence = Occurrence.find(params[:occurrence_id])
    @occurrence_location = @occurrence.occurrence_sources.create(occurrence_source_params)
    redirect_to occurrence_path(@occurrence)
  end

  def destroy
    @occurrence_location = OccurrenceLocation.find(params[:id])
    @occurrence_location.destroy

    redirect_to "/occurrences/#{params[:occurrence_id]}"
  end

  private
    def occurrence_location_params
      params.require(:occurrence_location).permit(:location_id, :occurrence_id)
    end
end
