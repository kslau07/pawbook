class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :placeholder_photo, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
