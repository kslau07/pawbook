# frozen_string_literal: true

# ReactionsHelper
module ReactionsHelper
  def emoji_enum_count(reactionable)
    reactionable.reactions.group(:kind).count
  end
end
