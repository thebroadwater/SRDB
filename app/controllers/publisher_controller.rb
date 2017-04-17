class PublisherController < ApplicationController
  def new
    @publisher = Publisher.new
  end

  def index
    @publisher = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end

end
