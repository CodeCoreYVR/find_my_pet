FactoryGirl.define do
  factory :message do
    association :pet, factory: :pet
    body { Faker::Company.catch_phrase }
  end
end
