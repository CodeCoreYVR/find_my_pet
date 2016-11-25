require 'rails_helper'

RSpec.describe CallbacksController, type: :controller do
  describe '#facebook' do
    it 'redirects to home' do
      request.env['omniauth.auth'] = {
        info: {name: 'John Doe', email: nil},
        provider: 'facebook',
        uid: '123'
      }.with_indifferent_access

      User.create({first_name: 'Hans', last_name: 'Grandel', email: 'asdf@lsdfj.com', password: 'aldfjsdlk', provider: 'facebook', uid: '123'})
      get :facebook
      expect(response).to redirect_to(home_path)
    end
  end

  describe '#twitter' do
    it 'redirects to home' do
      request.env['omniauth.auth'] = {
        info: {name: 'John Doe', email: nil},
        provider: 'twitter',
        uid: '123'
      }.with_indifferent_access

      User.create({first_name: 'Hans', last_name: 'Grandel', email: 'asdf@lsdfj.com', password: 'aldfjsdlk', provider: 'twitter', uid: '123'})
      get :twitter
      expect(response).to redirect_to(home_path)
    end
  end

end
