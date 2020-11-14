class CreateTradingStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :trading_statuses do |t|
      t.integer :trading_status, null: false

      t.timestamps
    end
  end
end
