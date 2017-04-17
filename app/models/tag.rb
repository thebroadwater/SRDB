class Tag < ApplicationRecord
  has_many :person_tags
  has_many :people, through: :person_tags
end
