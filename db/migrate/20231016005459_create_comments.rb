class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :commentable_id, null: false
      t.string :commentable_type, null: false

      t.timestamps
    end
  end
end
