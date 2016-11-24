FactoryGirl.define do
 factory :sighting do
   last_seen_at { Faker::Address.city }
   date_time { Faker::Date.forward(30) }
   note { Faker::Lorem.paragraph }
   lat { rand(49.1...49.3) }
   long { rand(-123.2...-122.0) }
   pet_type { Faker::Color.color_name }
   image { Faker::Color.color_name}
   name { Faker::Color.color_name }
   pet_id {1}
   contact { Faker::Color.color_name }
 end
end
