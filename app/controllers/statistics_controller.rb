class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new(statistic_params)
    if @statistic.save
      head :ok
    else
      render json: { errors: @statistic.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def statistic_params
    params.require(:statistic).permit(:value, :player_id, :game_id, :indicator_id)
  end
end