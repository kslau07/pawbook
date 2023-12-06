class PostsController < ApplicationController
  before_action :authenticate_user!

  # NOTE: Delete me
  # Turbo Frame helper methods available
  # turbo_stream.remove # Remove a turbo-frame
  # turbo_stream.prepend # Insert turbo-frame before first frame
  # turbo_stream.append # Append turbo-frame after last frame
  # turbo_stream.before # Insert turbo-frame before the specified frame
  # turbo_stream.after # Append turbo-frame after the specified frame
  # turbo_stream.update # Update the contents of a turbo-frame
  # turbo_stream.replace # Replace the contents of a turbo-frame

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.postable_new
  end

  def show; end

  def new; end

  def edit; end

  def create
    @post = Post.new(post_params)
    @post_reset_form = Post.postable_new

    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
    # if @post.save
    #   flash[:notice] = t 'notices.success', model: 'Post'
    #   redirect_to root_path
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def update; end

  def destroy; end

  private

  def post_params
    # Nested attrs for 'delegated_type'
    # SOURCE: https://github.com/rails/rails/pull/41717
    params.require(:post)
          # FIX:
          .permit(:postable_type, postable_attributes: %i[content], images: [])
          .merge(author: current_user)
  end
end
