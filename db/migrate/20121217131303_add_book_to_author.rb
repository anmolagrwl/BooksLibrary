class AddBookToAuthor < ActiveRecord::Migration
  def change
    add_column :authors, :book_id, :integer
    add_index :authors, :book_id
  end
end
