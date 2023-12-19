class AddIndexUniqueReactionableIdUserIdToReactions < ActiveRecord::Migration[7.0]
  def change
    add_index :reactions, %i[reactionable_id user_id], unique: true
  end
end
