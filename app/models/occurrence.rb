class Occurrence < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :events, through: :incidents
  has_many :occurrence_sources, dependent: :destroy
  has_many :occurrence_people, dependent: :destroy
  has_many :occurrence_groups, dependent: :destroy
  has_many :occurrence_locations, dependent: :destroy

  searchkick highlight: [:details, :date]
  # word_middle: [:details, :date]
end
