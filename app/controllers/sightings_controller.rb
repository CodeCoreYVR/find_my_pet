class SightingsController < ApplicationController
  before_action :set_defaults, only: [:new, :edit]
  before_action :find_sighting, only: [:show, :edit, :update, :destroy]

  def index
    @sightings = Sighting.order(created_at: :desc)
  end

  def new
    if params[:pet_id].present?
      @pet = Pet.friendly.find params[:pet_id]
      @sighting = Sighting.new
      @sighting.pet_type = @pet.pet_type
      @sighting.pet_id = params[:pet_id]
    else
      @sighting = Sighting.new
    end
  end

  def create
    @sighting = Sighting.new sighting_params
    if @sighting.save
      if @sighting.pet_id.present?
        SightingsMailer.notify_pet_owner(@sighting).deliver_now
      end
      redirect_to(
        pets_path,
        notice: 'Thanks for your colaboration! Pet owners will be notified.'\
        ' Have You seen any of those pets?'
      )
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @sighting.slug = nil
    if @sighting.update sighting_params
      redirect_to sighting_path(@sighting)
    else
      render :edit
    end
  end

  def destroy
    @sighting.destroy
    redirect_to sightings_path
  end

  private

  def set_defaults
    @pet_type = ['Dog', 'Cat', 'Bird', 'Guinea Pig',
                 'Hamster', 'Iguana', 'Snake', 'Other']

    @size = %w(Small Medium Big)

    @gender = %w(Male Female)
  end

  def find_sighting
    @sighting = Sighting.find params[:id]
  end

  def sighting_params
    params.require(:sighting).permit([:pet_type,
                                      :last_seen_time,
                                      :last_seen_date,
                                      :color,
                                      :size,
                                      :long,
                                      :lat,
                                      :note,
                                      :image,
                                      :name,
                                      :contact,
                                      :pet_id])
  end
end
