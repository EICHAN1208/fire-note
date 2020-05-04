class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many :articles
  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article
  # has_many :stocks
  # has_many :comments
end
