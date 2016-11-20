# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pet_type = ['Dog', 'Cat', 'Bird', 'Guinea Pig', 'Hamster', 'Iguana', 'Snake', 'Other']

size = ['Small', 'Medium', 'Big']

gender = ['Male', 'Female']

50.times do |i|
 Pet.create(name: Faker::Name.name,
           breed: Faker::Name.first_name,
           color: Faker::Color.color_name,
           gender: gender.sample,
           age:  (1+Random.rand(10)),
           last_seen_at: Faker::Address.city,
           last_seen_date: Faker::Date.forward(30),
           last_seen_time: Faker::Time.backward(30, :all),
           note: Faker::Lorem.paragraph,
           lat: rand(49.100000000...49.5000000000),
           long: rand(-123.000000000...-121.000000000),
           pet_type: pet_type.sample,
           size: size.sample)
end

200.times do |i|
 Sighting.create(name: Faker::Name.name,
           last_seen_at: Faker::Address.city,
           note: Faker::Lorem.paragraph,
           lat: rand(-90.000000000...90.000000000),
           long: rand(-180.000000000...180.000000000),
           pet_id:(Random.rand(1..Pet.count))
           )
end

10.times do |i|
      User.create(first_name: Faker::Name.first_name,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.email,
                   password: '123',
                   password_confirmation: '123'
                   )
end
