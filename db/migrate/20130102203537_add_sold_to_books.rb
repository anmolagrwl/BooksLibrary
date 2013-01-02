class AddSoldToBooks < ActiveRecord::Migration
  def change
    add_column :books, :sold, :boolean, :default => false
  end
end
