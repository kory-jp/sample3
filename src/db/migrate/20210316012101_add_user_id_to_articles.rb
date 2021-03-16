class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def up
    add_reference :articles, :user, foreign_key: true
  end

  def down
    remove_reference :articles, :user, foreign_key: true
  end
end
