# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

Booking.destroy_all
Car.destroy_all
User.destroy_all

puts "Creating users..."
user1 = User.create(email:"info1@info.com", encrypted_password: "rkgjbsdalkfbsafkab", password: "123456", first_name: "Stefan", last_name: "Alexandru")
user2 = User.create(email:"info@info.com", encrypted_password: "rkgjbsdalkfbsafkab", password: "123456", first_name: "Robert", last_name: "Muller")
user3 = User.create(email:"info3@info.com", encrypted_password: "rkgjbsdalkfbsafkab", password: "123456", first_name: "Mathis", last_name: "Krier")
user4 = User.create(email:"info4@info.com", encrypted_password: "rkgjbsdalkfbsafkab", password: "123456", first_name: "Gerard", last_name: "Mota")
user5 = User.create(email:"info5@info.com", encrypted_password: "rkgjbsdalkfbsafkab", password: "123456", first_name: "John", last_name: "Doe")

puts "Users created"
puts "Creatings cars..."

2.times do
  file = URI.open('https://res.cloudinary.com/de5zuxdp2/image/upload/v1669371474/yellow_ferrari_myptpm.jpg')
  ferrari = Car.create!(model: Faker::Vehicle.manufacture, price: 100, start_date: "28/11/2022", end_date: "02/02/2023", user_id: user1.id, location: "Amsterdam", description: Faker::Vehicle.version)
  ferrari.photo.attach(io: file, filename: 'wii.jpg', content_type: 'image/jpg')
  ferrari.save!
end

2.times do
  file = URI.open('https://res.cloudinary.com/de5zuxdp2/image/upload/v1669372566/red_supercar_4-t2_wr4ci8.jpg')
  porsche = Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user2.id, location: "London", description: Faker::Vehicle.version)
  porsche.photo.attach(io: file, filename: 'wii2.jpg', content_type: 'image/jpg')
  porsche.save!
end

2.times do
  file = URI.open('https://res.cloudinary.com/de5zuxdp2/image/upload/v1669372725/lambo_super_vx756k.jpg')
  lambo = Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user3.id, location: "Barcelona", description: Faker::Vehicle.version)
  lambo.photo.attach(io: file, filename: 'wii2.jpg', content_type: 'image/jpg')
  lambo.save!
end

2.times do
  file = URI.open('https://res.cloudinary.com/de5zuxdp2/image/upload/v1669372857/aston_martin_zrwybd.jpg')
  mazerati = Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user4.id, location: "Barcelona", description: Faker::Vehicle.version)
  mazerati.photo.attach(io: file, filename: 'wii3.jpg', content_type: 'image/jpg')
  mazerati.save!
end

2.times do
  file = URI.open('https://res.cloudinary.com/de5zuxdp2/image/upload/v1669372941/Porsche-Supercars-Hypercars_foybkg.jpg')
  supercar = Car.create!(model: Faker::Vehicle.manufacture, price: 150, start_date: "01/01/2023", end_date: "02/04/2023", user_id: user5.id, location: "Barcelona", description: Faker::Vehicle.version)
  supercar.photo.attach(io: file, filename: 'wii3.jpg', content_type: 'image/jpg')
  supercar.save!
  Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user5.id, car_id: supercar.id, status: "pending")
end

puts "Cars created"
puts "Creating bookings..."
Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user1.id, car_id: Car.last.id, status: "pending")
Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user2.id, car_id: Car.last.id, status: "pending")
puts "Bookings created"
puts "Done"

# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user4.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user5.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user1.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user2.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user3.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user4.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user5.id, car_id: Car.last.id, status: "pending")
# Booking.create!(start_date: "25/11/2023", end_date: "25/11/2024", user_id: user1.id, car_id: Car.last.id, status: "pending")
