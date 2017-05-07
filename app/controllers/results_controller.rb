class ResultsController < ApplicationController

  def new
    @result = Result.new
  end

  def index
    @results = Searchkick.search params[:search],
      index_name: [Occurrence, Person, Location, Group, Source],
      fields: ["name^10", "title^10", "type^5", "subtype^2", "details",],
      misspellings: {below: 2},
      highlight: {
        tag: "<strong>",
        fields: {
          details: {
            fragment_size: 100
          }
        }
      }
  end
end
