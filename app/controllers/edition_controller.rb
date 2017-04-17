class EditionController < ApplicationController
  def new
    @edition = Edition.new
  end

  def index
    @edition = Edition.all
  end

  def show
    @edition = Edition.find(params[:id])
  end

  private
    def edition_params
      params.require(:edition).permit(:name)
    end

end
