class OccurrencePeopleController < ApplicationController
  def create
    @occurrence = Occurrence.find(params[:occurrence_id])
    @occurrence_person = @occurrence.occurrence_people.create(occurrence_person_params)
    redirect_to occurrence_path(@occurrence)
  end

  def destroy
    @occurrence_person = OccurrencePerson.find(params[:id])
    @occurrence_person.destroy

    redirect_to "/occurrences/#{params[:occurrence_id]}"
  end

  private
    def occurrence_person_params
      params.require(:occurrence_person).permit(:person_id, :occurrence_id)
    end
end
