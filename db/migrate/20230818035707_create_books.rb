class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.text :title
      t.references :author, null: false, foreign_key: true
      t.text :genre
      t.string :description

      t.timestamps
    end
  end
end
