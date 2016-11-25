FactoryGirl.define do
  factory :sighting do
    pet
    name { Faker::Name.name }
    last_seen_at { Faker::Address.city }
    date_time { Faker::Time.backward(30, :all) }
    note { Faker::Lorem.paragraph }
    lat { rand(49.1...49.3) }
    long { rand(-123.2...-122.0) }
    pet_type { pet.pet_type }
    pet_id { pet.id }
    contact { Faker::Name.name }
  end
end
