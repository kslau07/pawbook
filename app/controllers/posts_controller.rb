class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show; end

  def new; end

  def edit; end
  def create; end

  def update; end

  def destroy; end

  private

  def post_params
    # params.require(:post).permit(:foo)
  end
end
