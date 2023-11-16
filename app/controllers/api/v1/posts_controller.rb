class Api::V1::PostsController < ApplicationController
  skip_forgery_protection
  before_action :authorize_request

  def index
    # Limit to last 10 newest posts
    # There is an index on "created_at" as this will be a common query
    posts = Post.includes(:author, :postable).order(created_at: :desc).limit(10)
    render json: format_json(posts), status: :ok
  end

  def show
    post = Post.where(id: post_params[:id])
    render json: format_json(post), status: :ok
  end

  private

  def format_json(posts)
    posts.map do |post|
      { post_id: post.id,
        post_type: post.postable_type,
        post_content: post.postable.content,
        author_info: { username: post.author.username,
                       pets_name: post.author.pets_name },
        num_of_comments: post.comments.count,
        num_of_reactions: post.reactions.count,
        created_at: post.created_at,
        updated_at: post.updated_at }
    end
  end

  def post_params
    params.permit(:id)
  end
end
