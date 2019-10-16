class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string     :title,       null: false
      t.integer    :user_id,     null: false
      t.integer    :message_id,  null: false
      t.timestamps               null: false
    end
  end
end
