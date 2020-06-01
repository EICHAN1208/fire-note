class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :stocks, dependent: :destroy
  has_many :comments, dependent: :destroy

  #記事がファボしてあるかどうかの判定
  def favorited_by?(user)
    favorites.where(user: user).exists?
  end

  #記事がストックしてあるかどうかの判定
  def stocked_by?(user)
    stocks.where(user_id: user.id).exists?
  end

  #いいね順をつくるために作成
  # ransacker :favorites_count do
  #   query = '(SELECT COUNT(favorites.article_id) FROM favorites where favorites.article_id = articles.id GROUP BY favorites.article_id)'
  #   Arel.sql(query)
  # end

  validates :title, presence: true, length: { maximum: 48 }
  validates :kind, presence: true
  validates :summary, presence: true
  validates :content, presence: true
end
