class Player < ApplicationRecord
  belongs_to :team
  has_many :statistics, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def check_indicator(indicator)
    last_games = Game.last_five_games.ids
    statistics.where(game_id: last_games, indicator_id: indicator.id).any?
  end

  def self.top_players(indicator, team = nil)
    condition = { statistics: { indicator_id: indicator.id } }
    condition[:players] = { team_id: team.id } if team.present?

    joins(:statistics).where(condition).group('players.id').order('sum(statistics.value) DESC').limit(5)
  end
end
