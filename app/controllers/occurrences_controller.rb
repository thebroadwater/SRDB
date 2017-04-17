class OccurrencesController < ApplicationController
  def new
    @occurrence = Occurrence.new
  end

  def create
    @occurrence = Occurrence.new(occurrence_params)

    if @occurrence.save
      if params[:event_id]
        @event = Event.find(params[:event_id])
        @event.occurrences << @occurrence
      end
      redirect_to @occurrence
    else
      render 'new'
    end
  end

  def index
    @occurrences = Occurrence.order(:date).all
  end

  def show
    @occurrence = Occurrence.find(params[:id])
  end

  def edit
    @occurrence = Occurrence.find(params[:id])
  end

  def update
    @occurrence = Occurrence.find(params[:id])

    if @occurrence.update(occurrence_params)
      redirect_to @occurrence
    else
      render 'edit'
    end
  end

  def destroy
    @occurrence = Occurrence.find(params[:id])
    @occurrence.destroy

    redirect_to occurrences_path
  end

  private
    def occurrence_params
      params.require(:occurrence).permit(:details, :date)
    end


end
