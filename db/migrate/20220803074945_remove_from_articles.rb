class RemoveFromArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :description
    remove_column :articles, :user_id
  end
end
