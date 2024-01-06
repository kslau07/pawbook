class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order(created_at: :desc).includes(:reactions, :comments)
    @post = Post.postable_new
    @reaction = Reaction.new

    # return unless current_user
    # @notifications = current_user.notifications.reverse
    # current_user.notifications.mark_as_read!
  end

  def show
    @post = Post.find(params[:id])
  end

  def new; end

  def edit; end

  def create
    @post = Post.new(post_params)
    set_postable_type(@post)
    @post_new = Post.postable_new # for turbo_stream

    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update; end

  def destroy
    @post = Post.find(params[:id])
    return unless @post.author == current_user

    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, status: :see_other }
      format.turbo_stream
    end
  end

  private

  # HACK: Project specs asked for polymorphic associations with Post
  #       This feels like a shoehorn though
  def set_postable_type(post)
    if post.images.attached? && post.postable.content.empty?
      post.postable = PhotoContent.new
      post.postable_type = PhotoContent
      post.postable.content = 'PhotoContent'
    elsif post.postable.content && !post.images.attached?
      post.postable_type = TextContent
    elsif post.postable.content && post.images.attached?
      content = post.postable.content
      post.postable = MixedContent.new
      post.postable_type = 'MixedContent'
      post.postable.content = content
    end
  end

  def post_params
    # Nested attrs for 'delegated_type'
    # SOURCE: https://github.com/rails/rails/pull/41717
    params.require(:post)
          .permit(:postable_type, postable_attributes: %i[content], images: [])
          .merge(author: current_user)
  end
end
