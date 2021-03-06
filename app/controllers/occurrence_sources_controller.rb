class OccurrenceSourcesController < ApplicationController
  def create
    @occurrence = Occurrence.find(params[:occurrence_id])
    @occurrence_source = @occurrence.occurrence_sources.create(occurrence_source_params)
    redirect_to occurrence_path(@occurrence)
  end

  def destroy
    @occurrence_source = OccurrenceSource.find(params[:id])
    @occurrence_source.destroy

    redirect_to "/occurrences/#{params[:occurrence_id]}"
  end

  private
    def occurrence_source_params
      params.require(:occurrence_source).permit(:source_id, :pages, :occurrence_id)
    end
end
