class Book < ActiveRecord::Base
  attr_accessible :id, :name, :volume, :year, :comment, :place_id, :user_id

  belongs_to :place
  belongs_to :user
  has_many :authors, dependent: :destroy

  validates :name,  presence: true, length: { maximum: 80 }
  validates :volume,  length: { maximum: 20 }
  validates_numericality_of :year, allow_nil: true, greater_than: 1900, less_than_or_equal_to: Time.now.year
  validates :comment,  length: { maximum: 120 }
  validates :user_id,  presence: true
end
