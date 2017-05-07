class Occurrence < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :events, through: :incidents
  has_many :occurrence_sources

  searchkick highlight: [:details]
end
