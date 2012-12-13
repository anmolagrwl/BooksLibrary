class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :id
      t.string :name
      t.string :volume
      t.integer :year
      t.string :comment
      t.integer :place_id
      t.integer :user_id

      t.timestamps
    end

    add_index :books, :place_id
    add_index :books, :user_id
  end
end
