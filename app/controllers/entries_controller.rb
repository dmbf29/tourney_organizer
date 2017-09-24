class EntriesController < ApplicationController
  def create
    tournament = Tournament.find(params[:tournament_id])
    if create_tournament_entries(tournament, params)
      tournament.create_group_games
      redirect_to tournament_path(tournament)
    else
      redirect_to tournament_groups_path(tournament)
    end
  end

  private

  def create_tournament_entries(tournament, params)
    params[:players].each_with_index do |player, index|
      Entry.create(
        group: find_group(tournament, index),
        player: Player.find(player),
        team: Team.find(params[:teams][index])
      )
    end
  end

  def find_group(tournament, index)
    if index <= 3
      Group.find_by(name: "A", tournament: tournament)
    elsif index >= 8
      Group.find_by(name: "C", tournament: tournament)
    else
      Group.find_by(name: "B", tournament: tournament)
    end
  end
end
