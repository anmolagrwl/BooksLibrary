class Author < ActiveRecord::Base
  attr_accessible :id, :name, :book_id

  belongs_to :book

  validates :name,  presence: true, length: { maximum: 80 }
end
