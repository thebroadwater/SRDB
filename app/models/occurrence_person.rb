class OccurrencePerson < ApplicationRecord
  belongs_to :occurrence
  belongs_to :person
end
