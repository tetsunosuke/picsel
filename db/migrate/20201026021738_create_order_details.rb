class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.integer :photo_id
      t.integer :price , null: false, default: 0
      t.integer :amount , null: false, default: 0
      t.integer :shipping_status , null: false
      t.timestamps
    end
  end
end
