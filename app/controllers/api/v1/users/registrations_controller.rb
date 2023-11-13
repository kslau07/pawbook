class Api::V1::Users::RegistrationsController < ApplicationController
  # Instead of a csrf token, the API uses a JWT for authentication
  skip_forgery_protection

  # TODO: Show: username, pets name
  #       DO NOT SHOW unless API consumer and other user are friends
  # GET /users/:id
  # def show
  #   render json: @user, status: :ok
  # end

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
    # We still use strong params, but we do not require the
    # API consumer to pass in a nested hash with a "user" key
    params.permit(:email, :username, :password)
  end
end
