class Order < ApplicationRecord
    # has_many :order_details, dependent: :destroy
    has_many :trading_statuses, dependent: :destroy
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    # enum status: ["入金待ち","入金完了"]
end
