require 'rails_helper'

RSpec.describe Pet, type: :model do

 describe 'validations' do

   it 'will have a pet type' do
     p = build(:pet, pet_type: nil)
     p.valid?
     expect(p.errors).to have_key(:pet_type)
   end

   it 'will have a name' do
     n = build(:pet, name: nil)
     n.valid?
     expect(n.errors).to have_key(:name)
   end

   it 'will have a color' do
     c = build(:pet, color: nil)
     c.valid?
     expect(c.errors).to have_key(:color)
   end

   it 'will have a gender' do
     p = build(:pet, gender: nil)
     p.valid?
     expect(p.errors).to have_key(:gender)
   end
   
 end
end
