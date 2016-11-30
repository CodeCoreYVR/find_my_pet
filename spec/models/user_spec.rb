require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'has a first name' do
      u = build(:user, first_name: nil)
      u.valid?
      expect(u.errors).to have_key(:first_name)
    end

    it 'has a last name' do
      u = build(:user, last_name: nil)
      u.valid?
      expect(u.errors).to have_key(:last_name)
    end

    it 'has an email' do
      u = build(:user, email: nil)
      u.valid?
      expect(u.errors).to have_key(:email)
    end

    it 'has a valid email format' do
      u = build(:user, email: 'potato')
      u.valid?
      expect(u.errors).to have_key(:email)
    end

    it 'has a unique email' do
      u = create(:user, email: 'goat@goat.goat')
      s = build(:user, email: 'goat@goat.goat')
      s.valid?
      expect(s.errors).to have_key(:email)
    end
  end

  describe 'associations' do
    it 'has many pets' do
      u = create(:user)
      x = u.pets.create
      expect(x.user_id).to eq(u.id)
    end
  end
end
