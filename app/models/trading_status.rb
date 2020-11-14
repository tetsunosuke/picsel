class TradingStatus < ApplicationRecord
    has_many :order_details, dependent: :destroy
    belongs_to :order
    enum trading_status: ["入金待ち","入金完了","発送準備中","発送済み","取引終了"]
end
