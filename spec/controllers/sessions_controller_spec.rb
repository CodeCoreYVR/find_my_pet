require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create' do

    context 'With existing User' do
      let(:user) {create(:user)}
      it 'redirects to Home page if right credentials' do
        post :create, params: {email: user.email, password: user.password}
        expect(response).to redirect_to(home_path)
      end

      it 'render new session page if wrong credentials' do
        post :create, params: {email: nil, password: user.password}
        expect(response).to render_template(:new)
      end

    end

    context 'Without existing User' do
      it 'render new session page if wrong credentials'
    end

  end

end
