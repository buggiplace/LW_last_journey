# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Deleting data'
Condolence.destroy_all
Funeral.destroy_all
User.destroy_all

puts 'Create users'
user = User.create!(email: "lucas@test.com", password: "123456")

puts 'Create funerals'
funeral = Funeral.create!(user: user)

puts 'Create condolences'
funeral.condolences.create!
funeral.condolences.create!