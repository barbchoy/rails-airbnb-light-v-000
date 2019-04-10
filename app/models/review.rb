class Review < ApplicationRecord

  belongs_to :guest, :class_name => 'User'
  belongs_to :house

end
