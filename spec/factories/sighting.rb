FactoryGirl.define do
  factory :sighting do
    address { Faker::Address.city }
    last_seen_time { Faker::Time.between(DateTime.now - 1, DateTime.now) }
    last_seen_date { Faker::Date.forward(30) }
    color { Faker::Color.color_name }
    size { Faker::Color.color_name }
    note { Faker::Lorem.paragraph }
    lat { rand(49.1...49.3) }
    long { rand(-123.2...-122.0) }
    pet_type { pet&.pet_type || Faker::Color.color_name }
    image { Faker::Color.color_name }
    name { Faker::Color.color_name }
    pet_id { pet&.id }
    contact { Faker::Color.color_name }
  end
end
