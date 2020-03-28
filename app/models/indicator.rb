class Indicator < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :statistics, dependent: :destroy
end
