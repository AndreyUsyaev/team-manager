require 'rails_helper'

RSpec.describe StatisticsController do
  let(:team) { create(:team) }
  let(:player) { create(:player, name: 'John', team: team) }
  let(:indicator) { create(:indicator) }
  let(:game) { create(:game) }

  describe "POST #create" do
    context 'when valid params' do
      it 'creates a statistic' do
        post :create, params: { statistic: { value: 10, indicator_id: indicator.id,
                                             game_id: game.id, player_id: player.id } }
        expect(response).to have_http_status(:ok)
        expect(player.statistics).to exist
      end
    end
    context 'when invalid params' do
      it "doesn't create a statistic" do
        post :create, params: { statistic: { value: 10, game_id: game.id, player_id: player.id } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
