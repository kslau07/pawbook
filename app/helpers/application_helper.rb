module ApplicationHelper
  # NOTE: Creates a dom identifier, use parent class only unless nested, then parent + child
  #       Could not get dom_id() working with nested records
  def dom_ident(parent, child = nil)
    if child
      "#{parent.class}-#{parent.id}-#{child.class}-#{child.id || 'new'}".downcase
    else
      "#{parent.class}-#{parent.id || 'new'}".downcase
    end
  end

  def emoji_enums
    { like: 0, heart: 1, laugh: 2, sad: 3 }
  end
end
