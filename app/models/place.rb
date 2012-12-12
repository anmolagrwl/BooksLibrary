class Place < ActiveRecord::Base
  attr_accessible :id, :name, :user_id

  belongs_to :user

  validates :name,  presence: true, length: { maximum: 80 }
  validates :user_id,  presence: true
end
