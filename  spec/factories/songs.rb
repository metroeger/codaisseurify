FactoryBot.define do
  factory :song do
    title         { Faker::Lorem.words(3).join(' ') }
    artist        { build(:artist) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
