class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.includes(:author, :postable)
    render json: format_json(posts), status: :ok
  end

  def show
    # @model_class_name = ModelClassName.find(params[:id])
  end

  private

  def format_json(posts)
    # posts comes in as an ActiveRecord Relation
    # .as_json changes certain items into json compatible syntax or json primitives (ie symbols to strings, date objects to string, etc )
    # .to_json first calls .as_json which creates an array of ruby hashes, then it serializes that into one long string
    # It seems we probably do not need to call .to_json ever, as Rails takes care of serializing in the 'render' call.

    # TODO: Fill out comments and reactions below
    posts.map do |post|
      { post_id: post.id,
        # postable: { type: post.postable_type,
        #             content: post.postable.content },
        postable: post.postable.as_json,
        author: { user_id: post.author.id,
                  email: post.author.email,
                  pets_name: post.author.pets_name },
        num_of_comments: 'fix me',
        num_of_reactions: 'fix me',
        created_at: post.created_at,
        updated_at: post.updated_at }
    end
  end
end
