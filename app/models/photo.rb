class Photo < ApplicationRecord
    attachment :image
    has_many :book_marks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :gallary, optional: true
    belongs_to :user
    has_many :hashtag_photos, dependent: :destroy
    has_many :hashtags, through: :hashtag_photos
    after_create do
        photo = Photo.find_by(id: id)
        # hashbodyに打ち込まれたハッシュタグを検出
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
          # ハッシュタグは先頭の#を外した上で保存
          tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
          photo.hashtags << tag
        end
      end
      #更新アクション
      before_update do
        photo = Photo.find_by(id: id)
        photo.hashtags.clear
        hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
        hashtags.uniq.map do |hashtag|
          tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
          photo.hashtags << tag
        end
      end
end
