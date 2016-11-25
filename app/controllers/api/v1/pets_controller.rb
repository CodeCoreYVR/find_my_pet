class Api::V1::PetsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    if params[:top].present?
      # TODO: rename the vars here in a better way. Move the query code to the
      #       model
      top = params[:top].to_f
      bottom = params[:bottom].to_f
      left = params[:left].to_f
      right = params[:right].to_f
      @pets = Pet.where(lat: bottom..top).where(long: left..right)
    else
      @pets = Pet.order(created_at: :desc)
    end
  end
end
