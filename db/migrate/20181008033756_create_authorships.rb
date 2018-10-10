class CreateAuthorships < ActiveRecord::Migration[5.2]
  def change
    create_table :authorships do |t|
      t.belongs_to :book, index: true
      t.belongs_to :author, index: true
      t.timestamps
    end
  end
end
