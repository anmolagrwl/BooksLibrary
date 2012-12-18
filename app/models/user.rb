class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :timeoutable and :omniauthable
  # :recoverable, :trackable
  devise :database_authenticatable, :registerable, :rememberable, :validatable,
         :lockable, lock_strategy: :failed_attempts, maximum_attempts: 5, unlock_strategy: :time, unlock_in: 30.minutes

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :name,  presence: true, length: { maximum: 50 }

  has_many :places, dependent: :destroy
  has_many :books, dependent: :destroy
end
