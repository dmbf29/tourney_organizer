class Player < ApplicationRecord
  has_many :entries
  has_many :games, through: :entries
  has_many :tournaments, through: :games
end
