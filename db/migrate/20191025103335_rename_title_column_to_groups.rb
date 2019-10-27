class RenameTitleColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    rename_column :groups, :title, :name
  end
end
