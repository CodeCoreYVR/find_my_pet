require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  include FactoryGirl::Syntax::Methods


  describe "#create" do
    before do
      @request.env['HTTP_REFERER'] = 'http://localhost:3000'
    end

    it "creates a successful message" do
      @pet=create(:pet)

      before_count=Message.count
      post(:create, params: {
          message: FactoryGirl.attributes_for(:message),
          # /ideas/:idea_id/comments
          pet_id: @pet.id,

      }
      )

      # create(:message)
      after_count=Message.count

      expect(before_count+1).to(eq(after_count))

    end
  end

  describe "#destroy" do
    before do
      @request.env['HTTP_REFERER'] = 'http://localhost:3000'
      @message=create(:message)

    end

    it "delete a successful message" do
      @pet=create(:pet)

      before_count=Message.count #1

      delete :destroy, { id: @message.id }

      after_count=Message.count #0
      byebug

      expect(before_count-1).to(eq(after_count))

    end
  end



  # describe "#create" do
  #   it "delete a message" do
  #     create(:message)
  #     before_count=Message.count
  #     after_count=Message.count
  #     expect(before_count+1).to(eq(after_count))
  #
  #   end
  # end


end
