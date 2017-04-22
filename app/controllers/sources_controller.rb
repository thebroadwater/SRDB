class SourcesController < ApplicationController

  helper_method :sort_column, :sort_direction

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(source_params)

    if @source.save
      redirect_to @source
    else
      render 'new'
    end
  end

  def index
    @sources = Source.all.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def show
    @source = Source.find(params[:id])
  end

  def edit
    @source = Source.find(params[:id])
  end

  def update
    @source = Source.find(params[:id])

    if @source.update(source_params)
      redirect_to @source
    else
      render 'edit'
    end
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy

    redirect_to sources_path
  end

  private
    def source_params
      params.require(:source).permit(:sku, :title, :edition_id, :publisher_id,
        :publication_date, :game_date, :notes, :back_text, :image_addr,
        :isbn10, :isbn13, :author)
    end

    def sort_column
      Source.column_names.include?(params[:sort]) ? params[:sort] : "title"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end
end
