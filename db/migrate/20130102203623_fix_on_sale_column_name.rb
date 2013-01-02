class FixOnSaleColumnName < ActiveRecord::Migration
  def up
    rename_column :books, :is_on_sale, :on_sale
  end

  def down
    rename_column :books, :on_sale, :is_on_sale
  end
end
