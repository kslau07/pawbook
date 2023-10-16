class CreateReactions < ActiveRecord::Migration[7.0]
  def change
    create_table :reactions do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :reactionable_id, null: false
      t.string :reactionable_type, null: false

      t.timestamps
    end
  end
end
