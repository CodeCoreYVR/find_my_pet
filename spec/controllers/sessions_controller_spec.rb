require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe '#create' do
    it 'redirects to Home page if right credentials' do
      post :create, params: { email: user.email, password: user.password }
      expect(response).to redirect_to(home_path)
    end

    it 'render new session page if wrong credentials' do
      post :create, params: { email: nil, password: user.password }
      expect(response).to render_template(:new)
    end
  end

  describe '#destroy' do
    it 'redirects to Home page' do
      request.session[:user_id] = user.id
      delete :destroy, params: { user_id: user.id }
      expect(response).to redirect_to(home_path)
    end
  end
end
