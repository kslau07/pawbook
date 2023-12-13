class Api::V1::UsersController < ApplicationController
  before_action :authorize_request
  before_action :find_user
  skip_forgery_protection

  def show
    render json: format_json(@user), status: :ok
  end

  private

  def format_json(user)
    {
      '1': { username: user.username,
             num_of_posts: user.posts.count }
    }
  end

  def find_user
    @user = User.find_by!(username: params[:_username])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end
end
