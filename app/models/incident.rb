class Incident < ApplicationRecord
  belongs_to :occurrence
  belongs_to :event
end
