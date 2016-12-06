class Api::V1::SightingsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    if params[:pet_id]
      pet = Pet.friendly.find params[:pet_id]
      @sightings = pet.sightings
    else
      @sightings = Sighting.all.limit(10)
    end
  end
end
