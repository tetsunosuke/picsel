class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title , null: false, default: ""
      t.integer :user_id
      t.string :image_id , null: false, default: ""
      t.text :caption , null: false
      t.integer :price , null: false, default: 0
     t.integer :gallary_id
     t.string :hashbody ,default:""
      t.boolean :is_active , null: false, default: true, comment: "ステータス"
      t.timestamps
    end
  end
end
