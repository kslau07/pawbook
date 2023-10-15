class CreateTextContents < ActiveRecord::Migration[7.0]
  def change
    create_table :text_contents do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
