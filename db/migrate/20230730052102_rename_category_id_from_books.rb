class RenameCategoryIdFromBooks < ActiveRecord::Migration[7.0]
  def change
    rename_column :books, :category_id, :genres_id
  end
end
