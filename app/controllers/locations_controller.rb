class LocationsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)

    if @location.save
      redirect_to @location
    else
      render 'new'
    end

    # Location.reindex
  end

  def index
    @locations = Location.order(sort_column + ' ' + sort_direction).all.page(params[:page])
  end

  def show
    @location = Location.find(params[:id])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to @location
    else
      render 'edit'
    end

    # Location.reindex
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    redirect_to locations_path
  end

  private
    def location_params
      params.require(:location).permit(:name, :description, :kind, :address,
        :city, :country, :notes)
    end

    def sort_column
      Location.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
