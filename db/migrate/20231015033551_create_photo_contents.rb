class CreatePhotoContents < ActiveRecord::Migration[7.0]
  def change
    create_table :photo_contents do |t|
      t.string :placeholder_content, null: false

      t.timestamps
    end
  end
end
