class Group < ApplicationRecord
  has_many :group_sources

  searchkick highlight: [:name, :kind, :subtype, :notes]
    # word_start: [:name, :kind, :subtype, :notes]
end
