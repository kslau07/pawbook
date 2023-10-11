class RenameUserToPetParentInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :pet_parent_id
  end
end
