class PostsController < ApplicationController
  before_action :authenticate_user!, except: %w[test] # TODO: Remove test

  def index
    @posts = Post.all
    @post = Post.new(author: @current_user)
  end

  def show; end

  def new; end

  def edit; end

  def create
    @text_content = TextContent.new(content: 'Lorem ipsum dolor')
    @post = Post.new(author: current_user, postable: @text_content)
    # @post = Post.new(posts_params)
    if @post.save
      redirect_to root_path, notice: 'Post saved successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  # TODO: Delete me
  def test; end

  private

  def post_params
    params.require(:post).permit(:foo)
  end
end
