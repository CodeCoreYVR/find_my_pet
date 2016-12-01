class UsersController < ApplicationController
  before_action :authenticate_user, only: [:index]
  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:first_name,
                                               :last_name,
                                               :email,
                                               :password,
                                               :password_confirmation)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'Thanks for signing up'
    else
      flash.now[:alert] = 'Please make sure all fields are filled in'
      render :new
    end
  end

  def index
  end
end
