# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative 'json'

puts "Starting seed"

puts "Cleaning old seeds"

Funeral.destroy_all

puts "Adding funerals"

filepath = "db/preferences.json"

serialized_preferences = File.read(filepath) #returns a string
preferences = JSON.parse(serialized_preferences)

puts "User Seed done - x added"

puts "Seed finished"



# 20.times do
#   Funeral.create!(
#     email: Faker::Internet.email,
#     password: "123456",
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name
#   )
# end
