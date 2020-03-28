class PlayersController < ApplicationController
  def check_indicator
    @player = Player.find(params[:id])
    @indicator = Indicator.find(params[:indicator_id])
    result = @player.check_indicator(@indicator)
    render json: { status: result }
  end

  def top_players
    @team = Team.find_by(id: params[:team_id]) if params[:team_id].present?
    @indicator = Indicator.find(params[:indicator_id])
    @players = Player.top_players(@indicator, @team)
    render json: { players: @players.as_json }
  end
end
