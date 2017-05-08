class Group < ApplicationRecord
  has_many :group_sources
  has_many :occurrence_groups

  searchkick highlight: [:name, :summary, :details, :kind, :subtype, :notes]
    # word_start: [:name, :summary, :details, :kind, :subtype, :notes]
end
