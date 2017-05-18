class GroupSourcesController < ApplicationController
  def create
    @group = Group.find(params[:group_id])
    @group_source = @group.group_sources.create(group_source_params)
    redirect_to group_path(@group)
  end

  def destroy
    @group_source = GroupSource.find(params[:id])
    @group_source.destroy

    redirect_to "/groups/#{params[:group_id]}"
  end

  private
    def group_source_params
      params.require(:group_source).permit(:source_id, :pages, :group_id)
    end
end
