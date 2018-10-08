class ChangeTypeBookToBookTypeInBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :type_book, :book_type
  end
end
