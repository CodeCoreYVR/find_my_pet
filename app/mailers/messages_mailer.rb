class MessagesMailer < ApplicationMailer
  def message_pet_owner(message)
    return if @user&.email
    @message = message
    @pet = message.pet
    @user = @pet.user
    mail(to: @user.email, subject: 'You got an sighting to your pet')
  end
end
