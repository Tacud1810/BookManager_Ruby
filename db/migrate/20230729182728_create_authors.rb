class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.integer :year_of_birth
      t.string :nationality
      t.text :description

      t.timestamps
    end
  end
end
