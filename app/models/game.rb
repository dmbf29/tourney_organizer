class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, optional: true
  belongs_to :screen
  belongs_to :entry_home, class_name: "Entry", foreign_key: "entry_home_id"
  belongs_to :entry_away, class_name: "Entry", foreign_key: "entry_away_id"
end
