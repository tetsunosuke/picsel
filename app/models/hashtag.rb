class Hashtag < ApplicationRecord
    validates :hashname, presence: true, length: { maximum: 50 }
    has_many :hashtag_photos, dependent: :destroy
    has_many :photos, through: :hashtag_photos
    # %w()の()の中に配列の要素にしたい文字列をスペース区切りで入力することで文字列の配列を表現しています

    def self.ransackable_attributes(auth_object = nil)
        %w(hashname)
    end

end
