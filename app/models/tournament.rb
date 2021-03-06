class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :games, dependent: :destroy
  has_many :entries, through: :groups

  validates :name, presence: true
  validates :entries_number, presence: true
  validates :date, presence: true

  TOURNAMENT_OPTIONS = [12]

  def self.options
    TOURNAMENT_OPTIONS
  end

  def create_groups
    num = 0
    3.times do
      Group.create(tournament: self, name: num)
      num += 1
    end
  end

  def create_group_games
    groups.each do |group|
      entries = []
      group.entries.each do |entry|
        entries << entry
      end
      games = RoundRobinTournament.schedule(entries.uniq)
      games.each_with_index do |round, index|
        week_matchups = round.map { |matchup| Game.create(tournament: self, group: group, entry_home: matchup.first, entry_away: matchup.last) }
        puts "Round #{index + 1}: #{week_matchups}"
      end
    end
  end
end
