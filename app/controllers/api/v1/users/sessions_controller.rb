class Api::V1::Users::SessionsController < ApplicationController
  skip_forgery_protection

  def create
    # user = User.find_by(email: login_params[:email])
    # Product.find_by("upc = ? OR cspc = ?", params[:code], params[:code])
    # user = User.find_by('email = ? OR username = ?',
                        # login_params[:email], login_params[:username])

    @user = User.find_by(email: login_params[:email])

    # If user is authenticated, return a JWT
    if @user&.valid_password?(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token:, exp: time.strftime('%m-%d-%Y %H:%M'),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
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
    params.permit(:email, :username, :password)
  end
end
