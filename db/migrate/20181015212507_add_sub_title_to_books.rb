class AddSubTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :sub_title, :string
  end
end
