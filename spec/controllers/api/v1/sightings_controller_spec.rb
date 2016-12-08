require 'rails_helper'

RSpec.describe Api::V1::SightingsController, type: :controller do
  render_views

  let(:pet) { create(:pet) }

  describe '#index' do
    it 'responds with 200 code' do
      get :index, format: :json, params: { id: pet.id }
      expect(response).to be_success
    end

    it 'returns the correct JSON' do
      FactoryGirl.create :sighting, pet_id: pet.id, lat: 49.0

      get :index, format: :json, params: { id: pet.id }
      json_response = JSON.parse(response.body).first
      expect(json_response['lat']).to eq(49.0)
    end

    it 'returns an empty array when there are no sightings' do
      get :index, format: :json, params: { id: pet.id }
      expect(JSON.parse(response.body)).to eq([])
    end

    it 'returns a json of correct length' do
      FactoryGirl.create_list(:sighting, 3, pet_id: pet.id)

      get :index, format: :json, params: { id: pet.id }
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end
end
