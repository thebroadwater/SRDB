class Source < ApplicationRecord
  has_many :person_sources
  has_many :location_sources
  has_many :group_sources
  belongs_to :publisher
  belongs_to :edition

  searchkick
end
