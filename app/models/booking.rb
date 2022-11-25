class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
end
