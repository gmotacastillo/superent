class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :model, :description, :location, :price, :start_date, :end_date, presence: true
  validates :description, length: { maximum: 300 }
end
