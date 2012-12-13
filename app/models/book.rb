class Book < ActiveRecord::Base
  attr_accessible :comment, :id, :name, :place_id, :user_id, :volume, :year
end
