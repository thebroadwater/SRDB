class GroupsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(groups_params)

    if @group.save
      redirect_to @group
    else
      render 'new'
    end

    Group.reindex
  end

  def index
    @groups = Group.order(sort_column + ' ' + sort_direction).all.page(params[:page])
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(groups_params)
      redirect_to @group
    else
      render 'edit'
    end

    Group.reindex
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  private
    def groups_params
      params.require(:group).permit(:name, :kind, :subtype, :notes)
    end

    def sort_column
      Group.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
