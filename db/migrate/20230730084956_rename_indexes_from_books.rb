class RenameIndexesFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_index :books, :authors_id
    remove_index :books, :genres_id
  end
end
