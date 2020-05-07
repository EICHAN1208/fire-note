class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  # has_many :stocks, dependent: :destroy
  has_many :comments, dependent: :destroy

  #記事がファボしてあるかどうかの判定
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true, length: { maximum: 50 }
  # validates :title, presence: true
  validates :summary, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 50 }
  validates :good_point, presence: true, length: { maximum: 50 }
  validates :problem, presence: true, length: { maximum: 50 }
  validates :try, presence: true, length: { maximum: 50 }
end
