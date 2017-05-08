class Location < ApplicationRecord
  has_many :location_sources
  has_many :occurrence_locations

  searchkick highlight: [:name, :summary, :details, :kind, :address, :city, :country]
    # word_start: [:name, :summary, :description, :kind, :address, :city, :country]
end
