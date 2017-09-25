class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, optional: true
  belongs_to :screen, optional: true
  belongs_to :entry_home, class_name: "Entry", foreign_key: "entry_home_id"
  belongs_to :entry_away, class_name: "Entry", foreign_key: "entry_away_id"
  belongs_to :winner, class_name: "Entry", foreign_key: "winner_id", optional: true
  belongs_to :loser, class_name: "Entry", foreign_key: "loser_id", optional: true
end
