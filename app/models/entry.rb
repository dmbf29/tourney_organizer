class Entry < ApplicationRecord
  belongs_to :team
  belongs_to :player
  belongs_to :group
  has_many :games_home, class_name: "Game", foreign_key: "entry_home_id"
  has_many :games_away, class_name: "Game", foreign_key: "entry_away_id"

  def games
    Game.where("entry_home_id = ? OR entry_away_id = ?", self.id, self.id)
  end

  def name
    player.name
  end
end
