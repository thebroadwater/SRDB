class Occurrence < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :events, through: :incidents
  has_many :occurrence_sources
  has_many :occurrence_people
  has_many :occurrence_groups
  has_many :occurrence_locations

  searchkick highlight: [:details, :date]
  # word_middle: [:details, :date]
end
