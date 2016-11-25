require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'home controller' do
    it '#index renders homepage index.html.erb' do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
