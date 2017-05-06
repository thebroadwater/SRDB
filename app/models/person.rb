class Person < ApplicationRecord
  has_many :person_sources
  has_many :person_tags
  has_many :tags, through: :person_tags

  searchkick
end
