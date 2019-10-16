class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string     :email,         null: false
      t.string     :password,      null: false
      t.string     :nickname,      null: false
      t.timestamps                 null: false
      t.integer    :group_id,      null: false
      t.integer    :message_id,    null: false


    end
  end
end
