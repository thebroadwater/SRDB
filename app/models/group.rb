class Group < ApplicationRecord
  has_many :group_sources, dependent: :destroy
  has_many :occurrence_groups, dependent: :destroy

  searchkick highlight: [:name, :summary, :details, :kind, :subtype, :notes]
    # word_start: [:name, :summary, :details, :kind, :subtype, :notes]
end
