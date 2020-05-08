class RemoveTryFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :try, :text
  end
end
