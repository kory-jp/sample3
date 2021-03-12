class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :mail, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    add_index :users, :mail, unique: true
  end

  def down
    drop_table :users
  end
end
