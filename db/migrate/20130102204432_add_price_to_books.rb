class AddPriceToBooks < ActiveRecord::Migration
  def change
    add_column :books, :price, :integer, :default => 0
  end
end
