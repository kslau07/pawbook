class PostsController < ApplicationController
  before_action :authenticate_user!, except: %w[test] # TODO: Remove test

  def index
    @posts = Post.all
  end

  def show; end

  def new; end

  def edit; end
  def create; end

  def update; end

  def destroy; end

  # TODO: Delete me
  def test; end

  private

  def post_params
    # params.require(:post).permit(:foo)
  end
end
