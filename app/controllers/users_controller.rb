class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    # check if friend request exists
    @user = User.find_by(username: params[:_username]) || current_user
    @friend_request_already_sent = @user != current_user && current_user.requests_sent.find_by(recipient_id: @user.id)
    @posts = @user.posts
    @post = Post.postable_new
  end
end
