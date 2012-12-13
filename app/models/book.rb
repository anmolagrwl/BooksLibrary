class Book < ActiveRecord::Base
  attr_accessible :comment, :id, :name, :place_id, :user_id, :volume, :year

  validates :name,  presence: true, length: { maximum: 80 }
  validates :user_id,  presence: true
end
