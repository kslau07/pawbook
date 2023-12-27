class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(username: params[:_username]) || current_user
    @posts = @user.posts
    @post = Post.postable_new
  end
end
