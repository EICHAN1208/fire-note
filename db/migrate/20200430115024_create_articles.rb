class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text   :title
      t.string :type
      t.text   :summary
      t.text   :content
      t.text   :good_point
      t.text   :problem
      t.text   :try
      t.integer :user_id
      t.timestamps
    end
  end
end
