class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, optional: true
  belongs_to :screen, optional: true
  belongs_to :entry_home, class_name: "Entry", foreign_key: "entry_home_id"
  belongs_to :entry_away, class_name: "Entry", foreign_key: "entry_away_id"
  belongs_to :winner, class_name: "Entry", foreign_key: "winner_id", optional: true
  belongs_to :loser, class_name: "Entry", foreign_key: "loser_id", optional: true

  def decide_outcome
    if self.entry_home_score > self.entry_away_score
      self.winner = entry_home
      self.loser = entry_away
    elsif self.entry_home_score < self.entry_away_score
      self.winner = entry_away
      self.loser = entry_home
    elsif self.entry_home_score == self.entry_away_score
      self.draw = true
    end
    save
  end
end
