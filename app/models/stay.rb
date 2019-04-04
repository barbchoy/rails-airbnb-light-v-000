class Stay < ApplicationRecord
  belongs_to :guest, :class_name => "User"
  belongs_to :house

  def stay_here(days)
    @cost = self.house.price_per_night * days
    if @cost > self.user.budget
      "Sorry #{days} days in #{self.house.name} is over your budget."
    elsif self.user.guests > self.house.max_guests
      "Sorry you have exceeded the maximum number of guests allowed in #{self.house.name}."
    else
      self.user.budget -= @cost
      "Thank you for staying in #{self.house.name}."
    end
  end
end
