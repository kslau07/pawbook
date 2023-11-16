class Api::V1::Users::RegistrationsController < ApplicationController
  skip_forgery_protection

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    # Flatten params hash for api consumers by omitting "required" key
    params.permit(:email, :username, :password)
  end
end
