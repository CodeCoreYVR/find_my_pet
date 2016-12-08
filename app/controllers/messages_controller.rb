class MessagesController < ApplicationController
  def create
    @pet = Pet.friendly.find(params[:pet_id])
    message_params = params.require(:message).permit(:body)
    @message = Message.new message_params
    @message.pet = @pet

    respond_to do |format|
      if @message.save
        MessagesMailer.message_pet_owner(@message).deliver_later
        format.js { render :create_success }
        format.html { redirect_back(fallback_location: pet_path(@pet)) }
      else
        format.js { render :create_failure }
        format.html { redirect_to :back, alert: 'Could not create message' }
      end
    end
  end

  def destroy
    @message = Message.find params[:id]
    pet = @message.pet

    respond_to do |format|
      if @message.destroy
        format.html do
          redirect_back(
            fallback_location: pet_path(pet),
            notice: 'Answer deleted!'
          )
        end
        format.js { render }
      else
        format.html { redirect_to home_path, alert: 'access denied!' }
        format.js { render js: 'alert("access denied!")' }
      end
    end
  end
end
