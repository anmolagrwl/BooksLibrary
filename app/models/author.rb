class Author < ActiveRecord::Base
  attr_accessible :id, :name, :book_id

  belongs_to :book
end
