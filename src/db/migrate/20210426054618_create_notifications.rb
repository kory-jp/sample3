class CreateNotifications < ActiveRecord::Migration[6.1]
  def up
    create_table :notifications do |t|
      t.integer :visitor_id, null: false
      t.integer :visited_id, null: false
      t.integer :article_id
      t.integer :comment_id
      t.integer :room_id
      t.integer :message_id
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end

  def down
    drop_table :notifications
  end
end
