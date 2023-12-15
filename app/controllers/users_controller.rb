class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # http://localhost:3000/users/test_user
    @user = User.find_by(username: params[:_username])
  end
end
