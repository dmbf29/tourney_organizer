class TournamentsController < ApplicationController
  before_action :set_tournament, only: [:edit, :update, :show]

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
    @group_a = Group.find_by(name: "A", tournament: @tournament)
    @group_b = Group.find_by(name: "B", tournament: @tournament)
    @group_c = Group.find_by(name: "C", tournament: @tournament)
    @standings_a = @group_a.entries.to_a.sort_by { |e| [e.points, e.difference] }
    @standings_b = @group_b.entries.to_a.sort { |a, b| b.points <=> a.points }
    @standings_c = @group_c.entries.to_a.sort { |a, b| b.points <=> a.points }
  end

  private

  def set_tournament_params
    params.require(:tournament).permit(:name, :date, :entries_number)
  end

  def set_tournament
    @tournament = Tournament.find(params[:id])
  end
end
