class House < ApplicationRecord

  # validates :name, presence: true, message: "Name of the house must not be blank."

  has_many  :stays
  has_many  :guests, through: :stays, :class_name => "User"
  belongs_to :owner, :class_name => "User"
  has_many :reviews

  accepts_nested_attributes_for :reviews

  def cleanliness_rating
    0
  end

  def location_rating
    0
  end

  def value_rating
    0
  end

  def reviews_count
    0
  end

end
