require 'rails_helper'

RSpec.describe SightingsController, type: :controller do

  describe '#index' do
    it 'renders index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    let(:pet) { create(:pet) }

    context 'with existing reported lost pet' do
      it 'renders new template' do
        params[:pet_id] = pet.id
        get :new, params: { sightings: attributes_for(:sighting,
                                                      pet_type: pet.pet_type,
                                                      pet_id: pet.id)
                                                    }
                                                    byebug
        expect(assigns(:sighting).pet_id).to eq(pet.id)
      end
    end

    context 'without reported lost pet' do
      it 'renders new template' do
        get :new, params: { sightings: attributes_for(:sighting,
                                                      pet_type: nil,
                                                      pet_id: nil)
                                                    }
        expect(assigns(:sighting).pet_id).to eq(nil)
      end
    end
  end

  describe '#create' do
    context 'with valid params' do
      context '' do
        it 'redirects to the home page' do
          post :create, params: { user: attributes_for(:user) }
          expect(response).to redirect_to(home_path)
        end
      end

      context '' do

      end
    end

    context 'with invalid params' do
      it 'renders the new template with errors' do
        post :create, params: { user: attributes_for(:user) }
        expect(response).to redirect_to(home_path)
      end
    end
  end

end
