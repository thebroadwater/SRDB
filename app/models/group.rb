class Group < ApplicationRecord
  has_many :group_sources

  searchkick highlight: [:name, :summary, :details, :kind, :subtype, :notes]
    # word_start: [:name, :summary, :details, :kind, :subtype, :notes]
end
