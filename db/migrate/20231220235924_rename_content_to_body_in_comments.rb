class RenameContentToBodyInComments < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :content, :body
  end
end
