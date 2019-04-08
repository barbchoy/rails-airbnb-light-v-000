class Stay < ApplicationRecord
  belongs_to :guest, :class_name => "User"
  belongs_to :house

  def stay_at_this_house(days)
    @cost = self.house.price_per_night * days
    if @cost > self.guest.budget
      "Sorry you do not have enough account balance to stay #{days} days in #{self.house.name}.\n
      Please choose another house or edit your profile."
    elsif self.guest.guests > self.house.max_guests
      "Sorry you have exceeded the maximum number of guests allowed in #{self.house.name}.\n
      Please choose another house or edit your profile."
    elsif self.guest.pets == true && self.house.pets_allowed == false
      "Sorry no pets allowed in #{self.house.name}. Please choose another house or edit your profile."
    else
      self.guest.budget -= @cost
      self.guest.save
      "Thank you for staying in #{self.house.name}. $#{@cost} has been deducted from your account balance."
    end
  end
end
