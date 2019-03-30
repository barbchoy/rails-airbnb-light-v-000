class User < ActiveRecord::Base

  has_many :stays
  has_many :houses, through: :stays

  has_secure_password

end
