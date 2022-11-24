# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

user = User.last

2.times do
  Car.create!(model: Faker::Vehicle.manufacture, price: 100, start_date: "28/11/2022", end_date: "02/02/2023", user_id: user.id, location: "Amsterdam", description: Faker::Vehicle.version)
end

2.times do
  Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user.id, location: "London", description: Faker::Vehicle.version)
end

2.times do
  Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user.id, location: "Barcelona", description: Faker::Vehicle.version)
end

10.times do
  Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: rand(1..5), car_id: 4)
end
