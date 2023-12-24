class FixUniqueIndexForReactions < ActiveRecord::Migration[7.0]
  def change
    remove_index :reactions, %i[reactionable_id user_id], unique: true
    add_index :reactions, %i[reactionable_id reactionable_type user_id], unique: true,
                                                                         name: 'index_reactions_on_reactionable_and_user_id'
  end
end
