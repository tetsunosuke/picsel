class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :postal_code , null: false, default: ""
      t.string :address , null: false, default: ""
      t.string :name , null: false, default: ""
      t.integer :user_id
      t.integer :total_payment , null: false, default: 0
      t.integer :payment_method , null: false
      t.integer :status , null: false
      t.integer :buyer_id, null:false
      t.timestamps
    end
  end
end
