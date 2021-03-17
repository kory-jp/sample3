class CreateFavorites < ActiveRecord::Migration[6.1]
  def up
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true

      t.timestamps
      t.index [:user_id, :article_id], unique: true
    end
  end

  def down
    drop_table :favorites
  end
end
