class Api::V1::UsersController < ApplicationController
  before_action :authorize_request
  skip_forgery_protection

  def show
    # user = User.find
    render json: format_json(1), status: :ok
  end

  private

  def format_json(_users)
    {
      username: 'bob'
    }
    # posts.map do |post|
    #   { post_id: post.id,
    #     post_type: post.postable_type,
    #     post_content: post.postable.content,
    #     author_info: { username: post.author.username,
    #                    pets_name: post.author.pets_name },
    #     num_of_comments: post.comments.count,
    #     num_of_reactions: post.reactions.count,
    #     created_at: post.created_at,
    #     updated_at: post.updated_at }
    # end
  end

  def user_params
    params.permit(:id)
  end
end
