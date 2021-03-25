class AddImageDataToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :image_data, :text
  end

  def down
    remove_column :users, :image_data, :text
  end
end
