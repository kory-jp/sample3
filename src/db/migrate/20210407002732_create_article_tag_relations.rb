class CreateArticleTagRelations < ActiveRecord::Migration[6.1]
  def up
    create_table :article_tag_relations do |t|
      t.references :article, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down 
    drop_table :article_tag_relations
  end
end
