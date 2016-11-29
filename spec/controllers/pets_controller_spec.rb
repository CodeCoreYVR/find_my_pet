require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  let(:user) {create(:user)}
  let(:pet) {create(:pet)}

  describe '#new' do
    before { request.session[:user_id] = user.id }
    it 'render the new template' do
      get :new
      expect(response).to render_template(:new)
    end
    it 'instantiates a new pet object' do
      get :new
      expect(assigns(:pet)).to be_a_new(Pet)
    end
  end

  describe '#create' do
    before { request.session[:user_id] = user.id }
    context 'with valid params' do
      def valid_request
        post :create, params: {pet: attributes_for(:pet)}
      end

      it 'saves a Record to the database' do
        count_before = Pet.count
        valid_request
        count_after = Pet.count
        expect(count_after).to eq(count_before + 1)
      end
      it 'redirects to the Pet show page' do
        valid_request
        expect(response).to redirect_to(pet_path(Pet.last))
      end
    end

    context 'with invalid params' do
      def invalid_request
        post :create, params: {pet: attributes_for(:pet, name: nil)}
      end
      it 'doesn\'t save a Record to the database' do
        count_before = Pet.count
        invalid_request
        count_after = Pet.count
        expect(count_after).to eq(count_before)
      end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#show' do
    before { request.session[:user_id] = user.id }
    it 'renders the show template' do
      pet = create(:pet)
      get :show, params: { id: pet.id }
      expect(response).to render_template(:show)
    end
    it 'sets an instance variable with the pet whose id is passed' do
      pet = create(:pet)
      get :show, params: { id: pet.id }
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe '#destroy' do
    def valid_request
      post :create, params: {pet: attributes_for(:pet)}
    end

    it 'destroy a Record from database' do
      # pet = FactoryGirl.create :pet
      # valid_request
      pet = create(:pet)
      user = pet.user
      request.session[:user_id] = user.id
      count_before = Pet.count
      delete :destroy, params: {id: pet.id}
      count_after = Pet.count
      expect(count_after).to eq(count_before - 1)
    end

    it 'redirects to the pet index page' do
      # pet = FactoryGirl.create :pet
      # pet = create(:pet)
      # valid_request
      pet = create(:pet)
      user = pet.user
      request.session[:user_id] = user.id
      delete :destroy, params: {id: pet.id}
      expect(response).to redirect_to(pets_path)
    end
  end
#
  describe '#index' do
    before(:each) do
      4.times { FactoryGirl.create :pet }
      get :index
    end

    it "returns 4 unique pets" do
      expect(Pet.count).to eq(4)
    end

    it 'renders the show template' do
      expect(response).to render_template(:index)
    end
  end

  describe '#edit' do
    it 'renders the edit template' do
      pet = create(:pet)
      user = pet.user
      request.session[:user_id] = user.id
      get :edit, params: { id: pet.id }
      expect(response).to render_template(:edit)
    end
    it 'sets an instance variable with the pet whose id is passed' do
      pet = create(:pet)
      user = pet.user
      request.session[:user_id] = user.id
      get :edit, params: { id: pet.id }
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe '#update' do
    def valid_request
      pet.user = user
      pet.save
      request.session[:user_id] = user.id
      patch :update, params: {id: pet.id, pet: {name: "New name"}}
    end
    # before { request.session[:user_id] = user.id }
    context 'with valid params' do

      it 'saves a Record to the database' do
        valid_request
        pet.reload
        expect(pet.name).to eq("New name")
      end

      it 'redirects to the pet show page' do
        valid_request
        expect(response).to redirect_to(pet_path(pet))
      end
    end

    context 'with invalid params' do
      def invalid_request
        pet.user = user
        pet.save
        request.session[:user_id] = user.id
        patch :update, params: {id: pet.id, pet: {name: "New name", pet_type: nil}}
      end

      it 'doesn\'t save a Record to the database' do
        invalid_request
        expect(Pet.last.name).not_to eq("New name")
      end
      it 'renders the new template' do
        invalid_request
        expect(response).to render_template(:edit)
      end
    end
  end
end
