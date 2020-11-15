class HashtagPhoto < ApplicationRecord
  belongs_to :photo
  belongs_to :hashtag
  validates :photo_id, presence: true
  validates :hashtag_id, presence: true
end
