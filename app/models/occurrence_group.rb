class OccurrenceGroup < ApplicationRecord
  belongs_to :occurrence
  belongs_to :group
end
