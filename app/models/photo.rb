class Photo < ApplicationRecord
    attachment :image
    has_many :book_marks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :gallary, optional: true
    belongs_to :user
end
