class GamesController < ApplicationController
  def update
    tournament = Tournament.find(params[:tournament_id])
    game = Game.find(params[:id])
    game.update(set_game_params)
    game.decide_outcome
    redirect_to tournament_path(tournament)
  end

  private

  def set_game_params
    params.require(:game).permit(
      :entry_home_score,
      :entry_away_score,
      :entry_home_score_aet,
      :entry_away_score_aet
    )
  end
end
