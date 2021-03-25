class AddIntroductonToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :introduction, :text
  end

  def down
    remove_column :users, :introduction, :text
  end
end
