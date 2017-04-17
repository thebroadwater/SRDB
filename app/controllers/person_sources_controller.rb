class PersonSourcesController < ApplicationController
  def create
    @person = Person.find(params[:person_id])
    @person_source = @person.person_sources.create(person_source_params)
    redirect_to person_path(@person)
  end

  private
    def person_source_params
      params.require(:person_source).permit(:source_id, :pages, :person_id)
    end
end
