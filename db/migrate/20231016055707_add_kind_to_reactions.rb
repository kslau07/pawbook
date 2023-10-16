class AddKindToReactions < ActiveRecord::Migration[7.0]
  def change
    add_column :reactions, :kind, :integer, null: false, default: ''
  end
end
