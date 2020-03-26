class PlayersController < ApplicationController
  def check_indicator
    @player = Player.find(params[:id])
    result = @player.check_indicator(params[:indicator_id])
    render json: { status: result }
  end

  def top_players

  end
end