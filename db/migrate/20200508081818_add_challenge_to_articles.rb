class AddChallengeToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :challenge, :text
  end
end
