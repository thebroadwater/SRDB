class Event < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :occurrences, through: :incidents

  accepts_nested_attributes_for :occurrences
end
