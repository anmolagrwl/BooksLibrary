class Book < ActiveRecord::Base
  attr_accessible :comment, :id, :name, :place_id, :user_id, :volume, :year

  belongs_to :place
  belongs_to :user

  validates :name,  presence: true, length: { maximum: 80 }
  validates :user_id,  presence: true
  validates_numericality_of :year, allow_nil: true, greater_than_or_equal_to: 1900
end
