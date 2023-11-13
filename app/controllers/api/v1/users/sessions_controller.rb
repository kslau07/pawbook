class Api::V1::Users::SessionsController < ApplicationController
  skip_forgery_protection

  def create
    user = find_user

    if user&.valid_password?(login_params[:password])
      token = JsonWebToken.encode(user_id: user.id)
      time = Time.zone.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def find_user
    User.find_by('email = ? OR username = ?',
                 login_params[:email], login_params[:username])
  end

  def login_params
    params.permit(:email, :username, :password)
  end
end
