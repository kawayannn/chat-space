class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.integer    :group_id,      null: false
      t.integer    :user_id,       null: false
      t.timestamps
    end
  end
end
