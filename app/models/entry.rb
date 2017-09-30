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
    pts = wins.where(round: 0).length * 3
    pts += draws
    pts
  end

  def difference
    home_games = Game.where(entry_home: self)
    away_games = Game.where(entry_away: self)
    goals = []
    conceded = []
    home_games.each do |game|
      goals << game.entry_home_score unless game.entry_home_score.nil?
      conceded << game.entry_away_score unless game.entry_away_score.nil?
    end
    away_games.each do |game|
      goals << game.entry_away_score unless game.entry_away_score.nil?
      conceded << game.entry_home_score unless game.entry_home_score.nil?
    end
    if goals.empty? || conceded.empty?
      0
    else
      goals.inject(:+) - conceded.inject(:+)
    end
  end
end
