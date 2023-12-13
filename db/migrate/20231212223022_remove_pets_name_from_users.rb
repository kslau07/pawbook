class RemovePetsNameFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :pets_name, :string
  end
end
