class GroupsController < ApplicationController
  def index
    @tournament = Tournament.find(params[:tournament_id])
    @groups = @tournament.groups
    @players = Player.all
    @teams = Team.all.order("rating DESC")
  end
end
