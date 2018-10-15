class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string "title"
      t.string "genre"
      t.string "classification"
      t.string "book_type"
      t.integer "year"
      t.string "sub_title"
      t.timestamps
    end
  end
end
