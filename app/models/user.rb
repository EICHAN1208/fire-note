class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles, dependent: :destroy
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :stocks
  has_many :stock_articles, through: :stocks, source: :article
  has_many :comments

  has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower

  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

  def feed
  following_ids = "SELECT follower_id FROM relationships
                  WHERE following_id = :user_id"
  Article.where("user_id IN (#{following_ids})
                  OR user_id = :user_id", user_id: id)
  end
end
