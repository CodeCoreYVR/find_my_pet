class CallbacksController < ApplicationController
  def facebook
    facebook_data = request.env['omniauth.auth']
    user = User.find_from_oauth(facebook_data)

    user ||= User.create_from_oauth(facebook_data)
    session[:user_id] = user.id
    redirect_to home_path
  end

  def twitter
    twitter_data = request.env['omniauth.auth']
    user = User.find_from_oauth(twitter_data)

    user ||= User.create_from_oauth(twitter_data)
    session[:user_id] = user.id
    redirect_to home_path
  end
end