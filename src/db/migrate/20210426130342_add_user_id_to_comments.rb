class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def up
    add_reference :comments, :user, null: false, foreign_key: true
  end

  def down
    remove_reference :comments, :user, null: false, foreign_key: true
  end
end
