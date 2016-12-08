class SightingsMailer < ApplicationMailer
  def notify_pet_owner(sighting)
    return if @user&.email
    @sighting = sighting
    @pet = sighting.pet
    @user = @pet.user
    mail(to: @user.email, subject: 'You got an sighting to your pet')
  end
end
