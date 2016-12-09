require 'rails_helper'

RSpec.describe SightingsController, type: :controller do
  let(:pet) { create(:pet) }

  describe '#index' do
    it 'renders index page' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe '#new' do
    context 'with existing reported lost pet' do
      it 'renders new template' do
        get :new, params: {
          pet_id: pet.id,
          sightings: attributes_for(:sighting, pet_type: pet.pet_type)
        }
        expect(assigns(:sighting).pet_id).to eq(pet.id)
      end
    end

    context 'without reported lost pet' do
      it 'renders new template' do
        get :new, params: {
          sightings: attributes_for(:sighting)
        }
        expect(assigns(:sighting).pet_id).to eq(nil)
      end
    end
  end

  describe '#create' do
    let(:pet) { create(:pet) }

    context 'with valid params' do
      it 'redirects to the sightings page' do
        post :create, params: {
          sighting: attributes_for(
            :sighting, pet_type: pet.pet_type, pet_id: pet.id
          )
        }
        expect(response).to redirect_to(pets_path)
      end
    end

    context 'with invalid params' do
      it 'renders the new template with errors' do
        post :create, params: {
          sighting: attributes_for(:sighting, pet_type: nil)
        }
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    let(:sighting) { create(:sighting) }

    it 'renders the show template' do
      get :show, params: { id: sighting.id }
      expect(response).to render_template(:show)
    end
  end

  describe '#edit' do
    let(:sighting) { create(:sighting) }

    it 'renders the edit template' do
      get :edit, params: { id: sighting.id }
      expect(response).to render_template(:edit)
    end
  end

  describe '#update' do
    let(:sighting) { create(:sighting) }

    context 'with valid params' do
      it 'redirects to sighting page' do
        patch :update, params: {
          id: sighting.id,
          sighting: attributes_for(
            :sighting,
            pet_type: sighting.pet_type,
            pet_id: sighting.pet_id
          )
        }
        expect(response).to redirect_to(sighting_path)
      end
    end

    context 'with invalid params' do
      it 'renders the edit template' do
        patch :update, params: {
          id: sighting.id, sighting: attributes_for(
            :sighting, pet_type: nil, pet_id: sighting.pet_id
          )
        }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe '#destroy' do
    let(:sighting) { create(:sighting) }

    it 'redirects to sightings page' do
      delete :destroy, params: { id: sighting.id }
      expect(response).to redirect_to(sightings_path)
    end
  end
end
