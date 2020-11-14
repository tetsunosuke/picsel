class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :photo
    enum shipping_status: {print: 0, shipped: 1, received: 2, done: 3} #["プリント開始","発送済み","受け取り評価待ち","取引終了"]

    #order_detail.shipping_status_i18n
end
