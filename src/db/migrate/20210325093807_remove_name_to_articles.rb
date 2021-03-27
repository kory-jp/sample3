class RemoveNameToArticles < ActiveRecord::Migration[6.1]
  def up
    remove_column :articles, :name, :string
  end

  def down
    add_column :articles, :name, :string
  end
end
