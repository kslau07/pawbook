# frozen_string_literal: true

# ReactionsHelper
module ReactionsHelper
  def emoji_enum_count(reactionable)
    reactionable.reactions.group(:kind).count
  end

  def current_user_reaction(reactionable)
    current_user.reactions.find_by(reactionable_type: reactionable.class.name, reactionable_id: reactionable.id)
  end
end
