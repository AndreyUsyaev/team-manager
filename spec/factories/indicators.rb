FactoryBot.define do
  factory :indicator do
    sequence(:name) { |i| "Indicator ##{i}" }
  end
end
