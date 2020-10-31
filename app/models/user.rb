class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_marks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts,through: :likes, source: :photo
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  attachment :profile_image
  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end
end
