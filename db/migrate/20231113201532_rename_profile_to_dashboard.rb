class RenameProfileToDashboard < ActiveRecord::Migration[7.0]
  def change
    rename_table :profiles, :dashboards
  end
end
