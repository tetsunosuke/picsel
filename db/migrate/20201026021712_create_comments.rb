class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :photo_id
      t.integer :user_id
      t.string :text, null:false
      t.timestamps
    end
  end
end
