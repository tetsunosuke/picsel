class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :photo
    enum shipping_status: ["未着手","プリント開始","発送準備中","発送済み"]
end
