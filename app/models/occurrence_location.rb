class OccurrenceLocation < ApplicationRecord
  belongs_to :occurrence
  belongs_to :location
end
