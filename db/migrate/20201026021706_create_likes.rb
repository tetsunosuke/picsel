class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :photo_id, foreign_key: true, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
