class AddColumnToArticles < ActiveRecord::Migration[6.1]
  def up
    add_column :articles, :image_data, :text
  end

  def down
    remove_column :articles, :image_data, :text
  end
end
