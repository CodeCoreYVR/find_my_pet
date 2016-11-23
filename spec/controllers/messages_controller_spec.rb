require 'rails_helper'

RSpec.describe MessagesController, type: :controller do


  describe "#create" do
    it "creates a successful message" do
      @post = Post.create(message: "Message")
      @post.should be_an_instance_of Post
    end
  end


end
