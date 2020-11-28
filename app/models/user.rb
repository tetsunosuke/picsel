class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :book_marks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_photos,through: :likes, source: :photo
  has_many :photos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  validates :first_name, presence: true,
                      length: { minimum: 1,maximum: 20}
  validates :last_name, presence: true,uniqueness:true,
                      length: { minimum: 1,maximum: 20}
  validates :email, presence: true, uniqueness: true,
                      length: { minimum: 1,maximum: 50}
  validates :introduce,length: { minimum: 1,maximum: 200}
  # has_one :card, optional: true

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end
  def follow!(other_user)
    # if Relationships.find_by(following_id: other_user.id, follower_id: current_user.id)
      # return false
    # else
      
      following_relationships.create!(following_id: other_user.id)
    # end
  end
  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
  attachment :profile_image
  def already_liked?(photo)
    self.likes.exists?(photo_id: photo.id)
  end

  def full_name
    last_name + ' ' + first_name
  end

  def self.fujiwara_full_name
    fujiwara = self.find_by(last_name: 'fujiwara')
    "#{fujiwara.last_name} #{fujiwara.first_name}"
  end

  def self.sawaki_full_name
    fujiwara = self.find_by(last_name: 'fujiwara')
    "#{fujiwara.last_name} #{fujiwara.first_name}"
  end

  def self.full_name(last_name)
    fujiwara = self.find_by(last_name: last_name)
    "#{fujiwara.last_name} #{fujiwara.first_name}"
  end

  def self.hoge
    "hoge"
  end

end
