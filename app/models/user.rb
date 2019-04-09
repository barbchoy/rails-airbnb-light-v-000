class User < ActiveRecord::Base

  validates :name, presence: true, message: "Name must not be blank."
  validates :email, uniqueness: true, message: "There is already an account associated with this email address. Please use another email address."
  validates :password, presence: true, message: "Password must not be blank."
  has_many :stays
  has_many :houses, through: :stays
  has_many :properties, :class_name => 'House', :foreign_key => 'owner_id'

  has_secure_password

end
