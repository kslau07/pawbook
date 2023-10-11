class AddPetsNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pets_name, :string
  end
end
