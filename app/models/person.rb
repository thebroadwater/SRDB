class Person < ApplicationRecord
  has_many :person_sources
  has_many :person_tags
  has_many :tags, through: :person_tags

  searchkick highlight: [:name, :metatype, :affiliation, :summary, :details, :notes]
    # word_start: [:name, :metatype, :affiliation, :summary, :details, :notes]
end
