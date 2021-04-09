class CreateMemberships < ActiveRecord::Migration[6.1]
  def up
    create_table :memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :memberships
  end
end
