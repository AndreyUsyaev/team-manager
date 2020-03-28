FactoryBot.define do
  factory :player do
    sequence(:name) { |i| "Player ##{i}" }
  end
end
