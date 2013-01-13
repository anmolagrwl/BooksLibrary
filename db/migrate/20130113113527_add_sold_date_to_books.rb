class AddSoldDateToBooks < ActiveRecord::Migration
  def change
    add_column :books, :sold_date, :date
  end
end
