class AddPostableColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :postable_id, :integer, null: false, default: ''
    add_column :posts, :postable_type, :string, null: false, default: ''
  end
end
