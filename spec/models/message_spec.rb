require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it 'will have a body' do
      m = Message.new
      m.valid?
      expect(m.errors).to have_key(:body)
    end
  end
end
