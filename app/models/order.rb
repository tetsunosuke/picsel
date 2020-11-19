class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    enum payment_method: ["クレジット","銀行振込"]
    enum status: ["入金完了"]
end
