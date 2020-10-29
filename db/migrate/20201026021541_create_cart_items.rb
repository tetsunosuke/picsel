class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :amount, :default => 0
      t.integer :photo_id
      t.integer :user_id
      t.timestamps
    end
  end
end
