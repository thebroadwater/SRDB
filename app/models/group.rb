class Group < ApplicationRecord
  has_many :group_sources

  searchkick
end
