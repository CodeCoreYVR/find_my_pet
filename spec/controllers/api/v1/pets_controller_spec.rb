require 'rails_helper'

RSpec.describe Api::V1::PetsController, type: :controller do
  render_views

  describe 'when map (:top param) is present' do
    it 'responds with 200 code' do
      get :index, format: :json, top: 49
      expect(response).to be_success
    end

    it 'returns a valid pet' do
      FactoryGirl.create :pet, name: 'Valid'
      get :index, format: :json,
                  top: 49.5,
                  bottom: 49.0,
                  left: -124.0,
                  right: -122.0
      json_response = JSON.parse(response.body).first
      expect(json_response['name']).to eq('Valid')
    end

    it 'does not return an invalid pet' do
      FactoryGirl.create :pet, name: 'Invalid', lat: 50.0
      get :index, format: :json,
                  top: 49.5,
                  bottom: 49.0,
                  left: -124.0,
                  right: -122.0
      expect(JSON.parse(response.body)).to eq([])
    end

    it 'returns the correct number of pets' do
      FactoryGirl.create_list(:pet, 3)
      FactoryGirl.create :pet, lat: 50.0
      FactoryGirl.create :pet, long: -125.0
      get :index, format: :json,
                  top: 49.5,
                  bottom: 49.0,
                  left: -124.0,
                  right: -122.0
      expect(JSON.parse(response.body).length).to eq(3)
    end
  end

  describe 'when map (:top param) is not present' do
    it 'responds with 200 code' do
      get :index, format: :json
      expect(response).to be_success
    end

    it 'returns a JSON list of correct length' do
      FactoryGirl.create_list(:pet, 5)
      get :index, format: :json
      expect(JSON.parse(response.body).length).to eq(5)
    end

    it 'returns correct JSON' do
      FactoryGirl.create :pet, name: 'Doggie'
      get :index, format: :json
      json_response = JSON.parse(response.body).first
      expect(json_response['name']).to eq('Doggie')
    end
  end
end
