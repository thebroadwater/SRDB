class ResultsController < ApplicationController

  def new
    @result = Result.new
  end

  def index
    @results = Searchkick.search params[:search],
      index_name: [Occurrence, Person, Location, Group, Source],
      misspellings: {below: 2}
  end
end
