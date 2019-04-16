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

  def overall_rating
    ratings = [cleanliness_rating, location_rating, value_rating]
    overall = ratings.inject(0.0) { |sum, el| sum + el } / ratings.size
    overall.round
  end

  def sort_by_price_per_night_asc
    self.order(:price_per_night)
  end

  def sort_by_price_per_night_desc
    self.reverse_order(:price_per_night)
  end

  def pets_ok
    self.where("pets_allowed = ?", true)
  end

  def mininum_guest(guests)
    self.where("max_guests = ?", params[guests])
  end

  def has_reviews
    self.joins("reviews on reviews.house_id = id").distinct
  end

  def in_location(city)
    self.where("city = ?", params[city])
  end


end
