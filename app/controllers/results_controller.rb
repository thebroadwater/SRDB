class ResultsController < ApplicationController

  def new
    @result = Result.new
  end

  def index
    @results = Searchkick.search params[:search],
      index_name: [Occurrence, Person, Location, Group, Source],
      fields: [
        "details^50",
        "title^100",
        "back_text^25",
        "name^100",
        "metatype^50",
        "affiliation^50",
        "bluf^75",
        "description^50",
        "notes^50",
        "kind^40",
        "subtype^40",
        "date",
        "address",
        "city",
        "country"
      ],
      # match: :word_start,
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
