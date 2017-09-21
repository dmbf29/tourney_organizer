class Entry < ApplicationRecord
  belongs_to :team
  belongs_to :player
  belongs_to :tournament
end
