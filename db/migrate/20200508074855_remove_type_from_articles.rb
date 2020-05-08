class RemoveTypeFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :type, :string
  end
end
