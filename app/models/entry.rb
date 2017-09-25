class Entry < ApplicationRecord
  belongs_to :team
  belongs_to :player
  belongs_to :group
  has_many :games_home, class_name: "Game", foreign_key: "entry_home_id"
  has_many :games_away, class_name: "Game", foreign_key: "entry_away_id"
  has_many :wins, class_name: "Game", foreign_key: "winner_id"
  has_many :losses, class_name: "Game", foreign_key: "loser_id"

  def games
    Game.where("entry_home_id = ? OR entry_away_id = ?", self.id, self.id)
  end

  def name
    player.name
  end

  def draws
    games = Game.where("entry_home_id = ? OR entry_away_id = ?", self.id, self.id)
    draw_games = games.where(draw: true)
    draw_games.length
  end

  def points
    pts = wins.length * 3
    pts += draws
    pts
  end

  def difference
    home_games = Game.where(entry_home: self)
    away_games = Game.where(entry_away: self)
    if home_games.map(&:entry_home_score).first.nil? || away_goals = away_games.map(&:entry_away_score).first.nil?
      "0"
    else
      home_goals = home_games.map(&:entry_home_score).inject(:+)
      away_goals = away_games.map(&:entry_away_score).inject(:+)
      home_conceded = home_games.map(&:entry_away_score).inject(:+)
      away_conceded = away_games.map(&:entry_home_score).inject(:+)
      goals = home_goals + away_goals
      conceded = home_conceded + away_conceded
      goals - conceded
    end
  end
end
