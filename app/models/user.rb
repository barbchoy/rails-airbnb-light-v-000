class User < ActiveRecord::Base

  has_many :stays
  has_many :houses, through: :stays
  has_many :properties, :class_name => 'House', :foreign_key => 'owner_id'

  has_secure_password

end
