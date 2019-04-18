class User < ActiveRecord::Base

  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true, allow_blank: true, case_sensitive: false

  has_many :stays
  has_many :houses, through: :stays
  has_many :properties, :class_name => 'House', :foreign_key => 'owner_id'
  has_many :reviews

  accepts_nested_attributes_for :reviews



end
