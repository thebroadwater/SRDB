class RootController < ApplicationController
  def index
  end

  def sitemap
    @people = Person.all
    @groups = Group.all
    @locations = Location.all
    @events = Event.all
    @occurrences = Occurrence.all
    @sources = Source.all
    respond_to do |format|
      format.xml
    end
  end
end
