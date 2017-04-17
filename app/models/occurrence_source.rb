class OccurrenceSource < ApplicationRecord
  belongs_to :occurrence
  belongs_to :source
end
