require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  let(:pet) { create(:pet) }
  let(:message) { create(:message) }

  describe '#create' do
    it 'creates a successful message' do
      before_count = Message.count
      post(:create, params: { message: attributes_for(:message),
                              pet_id: pet.id })
      after_count = Message.count

      expect(before_count + 1).to(eq(after_count))
    end
  end

  describe '#destroy' do
    it 'delete a successful message' do
      message
      before_count = Message.count # 1
      delete :destroy, params: { id: message.id }
      after_count = Message.count # 0

      expect(before_count - 1).to(eq(after_count))
    end
  end
end
