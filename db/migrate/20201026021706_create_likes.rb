class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :photo_id
      t.integer :user_id
      t.integer :count, null:false
      t.timestamps
      t.timestamps
    end
  end
end
