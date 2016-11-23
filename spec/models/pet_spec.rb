require 'rails_helper'

RSpec.describe Pet, type: :model do

 describe 'validations' do

   it 'will have a pet type' do
     p = Pet.new
     p.valid?
     expect(p.errors).to have_key(:pet_type)
   end

   it 'will have a name' do
     n = Pet.new
     n.valid?
     expect(n.errors).to have_key(:name)
   end

   it 'will have a color' do
     c = Pet.new
     c.valid?
     expect(c.errors).to have_key(:color)
   end

   it 'will have a gender' do
     p = Pet.new
     p.valid?
     expect(p.errors).to have_key(:gender)
   end

   it 'will have a last_seen_at' do
     p = Pet.new
     p.valid?
     expect(p.errors).to have_key(:last_seen_at)
   end
 end
end
