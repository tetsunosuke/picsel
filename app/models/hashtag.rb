class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: { maximum: 50 }
    has_many :hashtag_photos, dependent: :destroy
    has_many :photos, through: :hashtag_photos
end
