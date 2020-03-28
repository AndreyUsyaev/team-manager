FactoryBot.define do
  factory :team do
    sequence(:name) { |i| "Team ##{i}" }
    trait :with_players do
      after(:create) do |t|
        5.times do
          t.players << FactoryBot.create(:player, team: t)
        end
      end
    end
  end
end
