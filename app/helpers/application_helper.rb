module ApplicationHelper
  def dom_id_nested(parent, child = nil)
    combined_str = dom_id(parent).to_s
    combined_str += "_#{dom_id(child)}" if child
    combined_str
  end

  def emoji_enums
    { like: 0, heart: 1, laugh: 2, sad: 3 }
  end
end
