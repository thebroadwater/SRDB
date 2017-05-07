class Location < ApplicationRecord
  has_many :location_sources

  searchkick highlight: [:name, :description, :kind, :address, :city, :country]
    # word_start: [:name, :description, :kind, :address, :city, :country]
end
