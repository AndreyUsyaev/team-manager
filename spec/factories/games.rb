FactoryBot.define do
  factory :game do
    sequence(:name) { |i| "Game ##{i}" }
  end
end
