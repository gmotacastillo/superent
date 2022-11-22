# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

user = User.create!(email: "info@supereqwnt.com", password: "123456", password_confirmation: "123456", first_name: "Juan", last_name: "JuanJuan")

6.times do
  Car.create!(model: Faker::Vehicle.manufacture, price: 100, start_date: "20/12/2022", end_date: "02/02/2023", user_id: user.id)
end
