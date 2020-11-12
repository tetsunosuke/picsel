class Order < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :user
    default_scope -> { order(created_at: :desc) }
    enum status: ["入金待ち","入金完了","発送準備中","発送済み","取引終了"]
end
