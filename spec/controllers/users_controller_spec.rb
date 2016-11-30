require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do
    let(:user) {create(:user)}

    context 'with user signed in' do
      it 'renders the index template' do
        session[:user_id] = user.id
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'with no user signed in' do
      it 'redirects to the new user page' do
        get :index
        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "#create" do
    context 'with valid params' do
      it 'redirects to the home page' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(home_path)
      end
    end

    context 'with invalid params' do
      it 'render the new template' do
        post :create, params: { user: attributes_for(:user, first_name: nil)}
        expect(response).to render_template(:new)
      end
    end
  end
end
