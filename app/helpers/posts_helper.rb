module PostsHelper
  def current_user_emoji(post)
    current_user.reactions.find_by(reactionable_type: 'Post', reactionable_id: post.id)&.kind
  end
end
