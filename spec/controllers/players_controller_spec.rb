require 'rails_helper'

RSpec.describe PlayersController do
  let(:first_team) { create(:team, :with_players) }
  let(:player) { first_team.players.first }
  let(:second_team) { create(:team, :with_players) }
  let(:game) { create(:game) }

  describe "GET #check_indicator" do
    let(:successful_indicator) { create(:indicator) }
    let(:unsuccessful_indicator) { create(:indicator) }
    let!(:statistic) { create(:statistic, player: player, game: game, indicator: successful_indicator) }

    it "checks successfully specific players indicator " do
      get(:check_indicator, params: { id: player.id, indicator_id: successful_indicator.id })
      expect(JSON.parse(response.body)['status']).to be true
    end
    it "checks unsuccessfully specific players indicator " do
      get(:check_indicator, params: { id: player.id, indicator_id: unsuccessful_indicator.id })
      expect(JSON.parse(response.body)['status']).to be false
    end
  end

  describe "GET #top_players" do
    let(:indicator) { create(:indicator) }

    it 'returns top 5 players by specific team' do
      top_players = [first_team.players[0], first_team.players[2], first_team.players[4],
                     first_team.players[1], first_team.players[3]]

      top_players.each_with_index do |p, i|
        Statistic.create(game_id: game.id, indicator_id: indicator.id, player_id: p.id, value: 10 - i)
      end
      get(:top_players, params: { indicator_id: indicator.id, team_id: first_team.id })
      res = JSON.parse(response.body)
      expect(res['players']).to eq(top_players.map(&:as_json))
    end
    it 'returns top 5 players by all teams' do
      top_players = [first_team.players[0], second_team.players[3], first_team.players[4],
                     second_team.players[2], second_team.players[1]]
      top_players.each_with_index do |p, i|
        Statistic.create(game_id: game.id, indicator_id: indicator.id, player_id: p.id, value: 100 - i)
      end
      Statistic.create(game_id: game.id, indicator_id: indicator.id, player_id: first_team.players[1].id, value: 10)
      Statistic.create(game_id: game.id, indicator_id: indicator.id, player_id: first_team.players[3].id, value: 50)
      Statistic.create(game_id: game.id, indicator_id: indicator.id, player_id: second_team.players[4].id, value: 60)

      get(:top_players, params: { indicator_id: indicator.id })
      res = JSON.parse(response.body)
      expect(res['players']).to eq(top_players.map(&:as_json))
    end
  end
end
