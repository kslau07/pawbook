module CommentsHelper
  # Shorten time ago, eg "11 minutes ago" -> "11m ago"
  def abbreviate_time_ago
    # <span><%= "#{time_ago_in_words(comment.created_at)} ago" %></span>
  end
end
