class CreateMsgs < ActiveRecord::Migration[7.0]
  def change
    create_table :msgs do |t|
      t.string :body
      t.references :msg_sender, foreign_key: { to_table: :users }, null: false
      t.references :msg_recipient, foreign_key: { to_table: :users }, null: false
      # t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
