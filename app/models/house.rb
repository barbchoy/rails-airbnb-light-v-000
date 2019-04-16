class House < ApplicationRecord

  # validates :name, presence: true, message: "Name of the house must not be blank."

  has_many  :stays
  has_many  :guests, through: :stays, :class_name => "User"
  belongs_to :owner, :class_name => "User"
  has_many :reviews

  accepts_nested_attributes_for :reviews

  def cleanliness_rating
    self.reviews.average(:cleanliness_rating)
  end

  def location_rating
    self.reviews.average(:location_rating)
  end

  def value_rating
    self.reviews.average(:value_rating)
  end


end
