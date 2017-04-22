class PeopleController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person
    else
      render 'new'
    end
  end

  def index
    @people = Person.order(sort_column + ' ' + sort_direction).page(params[:page])
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path
  end

  private
    def person_params
      params.require(:person).permit(:name, :bluf, :metatype, :affiliation,
        :description, :notes, :active)
    end

    def sort_column
      Person.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

end
