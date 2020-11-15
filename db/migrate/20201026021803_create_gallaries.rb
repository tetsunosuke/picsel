class CreateGallaries < ActiveRecord::Migration[5.2]
  def change
    create_table :gallaries do |t|
      t.integer :photo_id, null: false
      t.string :gallary_name , null: false
      t.timestamps
    end
  end
end
