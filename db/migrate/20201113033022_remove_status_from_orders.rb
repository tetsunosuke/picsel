class RemoveStatusFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :Status, :integer
  end
end
