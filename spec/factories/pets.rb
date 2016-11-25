FactoryGirl.define do
  factory :pet do
    name { Faker::Name.name }
    breed { Faker::Name.first_name }
    color { Faker::Color.color_name }
    gender { Faker::Color.color_name }
    age  { (1+Random.rand(10)) }
    last_seen_at { Faker::Address.city }
    last_seen_date { Faker::Date.forward(30) }
    last_seen_time { Faker::Time.backward(30, :all) }
    note { Faker::Lorem.paragraph }
    lat { rand(49.1...49.3) }
    long { rand(-123.2...-122.0) }
    pet_type { Faker::Color.color_name }
    size { Faker::Color.color_name }
  end
end