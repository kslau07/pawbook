class Users::FriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(username: params[:username])
  end
end
