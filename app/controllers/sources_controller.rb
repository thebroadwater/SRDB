class SourcesController < ApplicationController
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
    @sources = Source.order(:title).all
    # @sources = Source.all.order("edition_id ASC, SKU ASC")
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
      params.require(:source).permit(:sku, :title, :edition, :publisher,
        :publication_date, :game_date, :notes, :back_text, :image_addr)
    end

end
