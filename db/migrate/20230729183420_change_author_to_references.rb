class ChangeAuthorToReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :authors
  end
end
