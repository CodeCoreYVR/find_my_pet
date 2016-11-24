FactoryGirl.define do
  factory :sighting do
    name { Faker::Name.name }
    last_seen_at { Faker::Address.city }
    date_time { Faker::Time.backward(30, :all) }
    note { Faker::Lorem.paragraph }
    lat { rand(49.1...49.3) }
    long { rand(-123.2...-122.0) }
    pet_type { Faker::Color.color_name }
    pet_id { rand(1..10) }
    contact { Faker::Name.name }
  end
end
