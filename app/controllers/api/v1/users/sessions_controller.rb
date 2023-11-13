class Api::V1::Users::SessionsController < ApplicationController
  skip_forgery_protection

  def create
  user = User.find_by(email: login_params[:email])

    if user&.authenticate(login_params[:password])
      # TODO: Continue here
      # We have an email/username/password, we want to log in through this API
      # endpoint and get back a JWT
      token = JsonWebToken.encode(user_id: @user.id)
    end
    
  end

  def login
    @user = User.find_by(email: login_params[:email])

    # If user is authenticated, return a JWT
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end
