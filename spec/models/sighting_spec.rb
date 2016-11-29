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

    it 'it has a date_time' do
      s = build(:sighting, last_seen_date: nil)
      s.valid?
      expect(s.errors).to have_key(:last_seen_date)
    end

  end

  describe 'associations' do

    it 'belongs_to pet' do
      x = create(:pet)
      s = x.sightings.create
      expect(s.pet_id).to eq(x.id)
    end

  end

end
