class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :year
      t.integer :pages
      t.text :description
      t.references :category
      t.text :image

      t.timestamps
    end
  end
end
