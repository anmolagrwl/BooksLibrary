class AddIsOnSaleToBooks < ActiveRecord::Migration
  def change
    add_column :books, :is_on_sale, :boolean, :default => false
  end
end
