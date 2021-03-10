class CreateArticles < ActiveRecord::Migration[6.1]
  def up
    create_table :articles do |t|
      t.string :name, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end

  def down
    drop_table :articles
  end
end
