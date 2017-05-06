class Location < ApplicationRecord
  has_many :location_sources

  searchkick
end
