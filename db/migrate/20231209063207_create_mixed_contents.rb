class CreateMixedContents < ActiveRecord::Migration[7.0]
  def change
    create_table :mixed_contents do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
