class House < ApplicationRecord

  validates :name, presence: true, message: "Name of the house must not be blank"

  has_many  :stays
  has_many  :guests, through: :stays, :class_name => "User"
  belongs_to :owner, :class_name => "User"

end
