class Game < ApplicationRecord
  belongs_to :tournament
  belongs_to :group, optional: true
  belongs_to :screen, optional: true
  belongs_to :entry_home, class_name: "Entry", foreign_key: "entry_home_id"
  belongs_to :entry_away, class_name: "Entry", foreign_key: "entry_away_id"
  belongs_to :winner, class_name: "Entry", foreign_key: "winner_id", optional: true
  belongs_to :loser, class_name: "Entry", foreign_key: "loser_id", optional: true

  enum round: [:group_stage, :quarterfinals, :semifinals, :final]
  enum knockout_name: [:quarter_one, :quarter_two, :quarter_three, :quarter_four, :semi_one, :semi_two, :final_one]

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

  def check_knockout_games
    if knockout_name
      games = Game.where(tournament: tournament, round: round)
      return if games.where(winner: nil).any?

      if round == "quarterfinals"
        create_semis(self.tournament)
      elsif round == "semifinals"
        create_final(self.tournament)
      end
    end
  end

  def create_semis(tournament)
    Game.create(tournament: tournament,
                entry_home: Game.find_by(tournament: tournament, knockout_name: "quarter_one").winner,
                entry_away: Game.find_by(tournament: tournament, knockout_name: "quarter_two").winner,
                round: 2,
                knockout_name: 4
                )
    Game.create(tournament: tournament,
                entry_home: Game.find_by(tournament: tournament, knockout_name: "quarter_three").winner,
                entry_away: Game.find_by(tournament: tournament, knockout_name: "quarter_four").winner,
                round: 2,
                knockout_name: 5
                )
  end

  def create_final(tournament)
    Game.create(tournament: tournament,
                entry_home: Game.find_by(tournament: tournament, knockout_name: "semi_one").winner,
                entry_away: Game.find_by(tournament: tournament, knockout_name: "semi_two").winner,
                round: 2,
                knockout_name: 6
                )
  end
end
