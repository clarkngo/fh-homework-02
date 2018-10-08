class AddSubTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    # add / remove :table_name, :field/column_name, :data_type
    add_column :books, :sub_title, :string
  end
end
