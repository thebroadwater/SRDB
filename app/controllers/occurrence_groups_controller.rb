class OccurrenceGroupsController < ApplicationController
  def create
    @occurrence = Occurrence.find(params[:occurrence_id])
    @occurrence_group = @occurrence.occurrence_groups.create(occurrence_group_params)
    redirect_to occurrence_path(@occurrence)
  end

  def destroy
    @occurrence_group = OccurrenceGroup.find(params[:id])
    @occurrence_group.destroy

    redirect_to "/occurrences/#{params[:occurrence_id]}"
  end

  private
    def occurrence_group_params
      params.require(:occurrence_group).permit(:group_id, :occurrence_id)
    end
end
