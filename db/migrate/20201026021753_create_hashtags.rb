class CreateHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.integer :order_id
      t.integer :photo_id
      t.string :tagname, null:false
      t.timestamps
    end
  end
end
