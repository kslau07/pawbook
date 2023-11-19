class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.new(postable_type: 'TextContent') # postable_type is required
    @post.build_postable
  end

  def show; end

  def new; end

  def edit; end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:notice] = t 'notices.success', model: 'Post'
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def post_params
    # Nested attrs for 'delegated_type'
    # SOURCE: https://github.com/rails/rails/pull/41717
    params.require(:post)
          .permit(:postable_type, postable_attributes: %i[content])
          .merge(author: current_user)
  end
end
