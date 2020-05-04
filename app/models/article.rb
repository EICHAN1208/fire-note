class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  # has_many :stocks, dependent: :destroy
  # has_many :comments, dependent: :destroy

  #記事がファボしてあるかどうかの判定
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
