require 'rails_helper'

RSpec.describe Sighting, type: :model do

  describe 'validations' do

    it 'has a pet type' do
      s = build(:sighting, pet_type: nil)
      s.valid?
      expect(s.errors).to have_key(:pet_type)
    end

    it 'has a last_seen_at' do
      s = build(:sighting, last_seen_at: nil)
      s.valid?
      expect(s.errors).to have_key(:last_seen_at)
    end

    it 'has a last_seen_date' do
      s = build(:sighting, last_seen_date: nil)
      s.valid?
      expect(s.errors).to have_key(:last_seen_date)
    end

    it 'has a last_seen_time' do
      s = build(:sighting, last_seen_time: nil)
      s.valid?
      expect(s.errors).to have_key(:last_seen_time)
    end

    it 'has a color' do
      s = build(:sighting, color: nil)
      s.valid?
      expect(s.errors).to have_key(:color)
    end

    it 'has a size' do
      s = build(:sighting, size: nil)
      s.valid?
      expect(s.errors).to have_key(:size)  
    end

  end

  describe 'associations' do

    it 'belongs_to pet' do
      pet = create(:pet)
      spotted = pet.sightings.create
      expect(spotted.pet_id).to eq(pet.id)
    end

  end

end
