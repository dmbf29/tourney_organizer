class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:edit, :update, :show, :start_knockout_round]
  before_action :set_groups_and_standings, only: [:show, :start_knockout_round]

  def index
    @tournaments = Tournament.all
  end

  def new
    @tournament = Tournament.new
  end

  def create
    tournament = Tournament.new(set_tournament_params)
    if tournament.save
      tournament.create_groups
      redirect_to tournament_groups_path(tournament)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @tournament.update(set_tournament_params)
    if tournament.save
      redirect_to tournament_path(tournament)
    else
      render :edit
    end
  end

  def show
    @quarter_one   = Game.find_by(tournament: @tournament, knockout_name: 0)
    @quarter_two   = Game.find_by(tournament: @tournament, knockout_name: 1)
    @quarter_three = Game.find_by(tournament: @tournament, knockout_name: 2)
    @quarter_four  = Game.find_by(tournament: @tournament, knockout_name: 3)
    @semi_one      = Game.find_by(tournament: @tournament, knockout_name: 4)
    @semi_two      = Game.find_by(tournament: @tournament, knockout_name: 5)
    @final_one     = Game.find_by(tournament: @tournament, knockout_name: 6)
  end

  def start_knockout_round
    # Make unless games finished
      Game.create(tournament: @tournament, entry_home: @standings_a[0], entry_away: @standings_b[1], round: 1, knockout_name: 0)
      Game.create(tournament: @tournament, entry_home: @standings_b[0], entry_away: @standings_c[1], round: 1, knockout_name: 1)
      Game.create(tournament: @tournament, entry_home: @standings_c[0], entry_away: @standings_a[1], round: 1, knockout_name: 2)
      Game.create(tournament: @tournament, entry_home: third_place_teams[0], entry_away: third_place_teams[1], round: 1, knockout_name: 3)
    redirect_to tournament_path(@tournament)
  end

  private

  def set_tournament_params
    params.require(:tournament).permit(:name, :date, :entries_number)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end

  def set_groups_and_standings
    @group_a = Group.find_by(name: "A", tournament: @tournament)
    @group_b = Group.find_by(name: "B", tournament: @tournament)
    @group_c = Group.find_by(name: "C", tournament: @tournament)
    @standings_a = @group_a.entries.sort_by { |e| [e.points, e.difference] }.reverse
    @standings_b = @group_b.entries.sort_by { |e| [e.points, e.difference] }.reverse
    @standings_c = @group_c.entries.sort_by { |e| [e.points, e.difference] }.reverse
  end

  def third_place_teams
    teams = []
    teams << @standings_a[2]
    teams << @standings_b[2]
    teams << @standings_c[2]
    teams.sort_by { |e| [e.points, e.difference] }.reverse
  end
end
