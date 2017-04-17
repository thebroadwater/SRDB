class PersonSource < ApplicationRecord
  belongs_to :person
  belongs_to :source
end
