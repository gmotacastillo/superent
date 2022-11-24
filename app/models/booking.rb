class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  enum status: { active: 0, archived: 1 }
end
