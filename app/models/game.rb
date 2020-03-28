class Game < ApplicationRecord
  validates :name, presence: true
  has_many :statistics, dependent: :destroy

  scope :last_five_games, -> { order(id: :desc).limit(5) }
end
