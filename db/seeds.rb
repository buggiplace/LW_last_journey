# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

puts "Starting seed"

puts "Cleaning old seeds"

Condolence.destroy_all
Funeral.destroy_all
User.destroy_all

Location.destroy_all

# filepath = "db/preferences.json"
# serialized_preferences = File.read(filepath) #returns a string
# preferences = JSON.parse(serialized_preferences)

# puts 'Create users'
# user = User.create!(email: "lucas@test.com", password: "123456")
# puts "User Seed done - x added"


puts 'Create 2 users and 1 representative'
simon = User.create!(first_name: 'Simon',
                     last_name: 'Turbo',
                     birth_date: Date.new(1989, 2, 1),
                     email: "simon@test.com",
                     password: "123456789",
                     kind: 1)
lena = User.create!(first_name: 'Lena',
                    last_name: 'Link',
                    birth_date: Date.new(1978, 3, 3),
                    email: "lena@test.com",
                    password: "12345678")
lisa = User.create!(first_name: 'Lisa',
                    last_name: 'Href',
                    birth_date: Date.new(1977, 3, 3),
                    email: "lisa@test.com",
                    password: "12345678")
# funeral = Funeral.create!(user: lena, representative_email: simon.email)


puts 'Create funerals'

puts 'Adding some meat to Lisas Funeral account'

lisa.funeral.funeral_type.update(
  burial_type: 'Burial',
  comment: 'Please no flowers. I really hate flowers!'
  )
lisa.funeral.playlist.update(
  spotify_url: 'spotify:playlist:09vrf9JgCt1AD06mqwlubq',
  spotify_profile_url: "spotify:user:buggiplace")
lisa.funeral.digital_will.update(
  cancel_accounts: ["Spotify", "Netflix"],
  facebook_obituary: 'false',
  bank_account_1: 'n26',
  bank_account_2: 'Coinbase',
  insurance_account_1: 'Getsurance',
  insurance_account_2: 'Lemonade',
  hardware: 'Destroy all harddrives',
  comment: 'Make sure my parents never get the naked pictures from my Laptop'
  )
lisa.funeral.obituary.update(
  last_words: 'Thank you for a wonderful life. Keep on rockin! I do not regret anything and am more than thankful
  for all the great memories I treasure with my friends and family. Enjoy everyday and start coding! ',
  guestlist: ["Tim.Mueller@gmx.de", "Jana.Schuhmann@gmail.com", "Luisa.Sidiqi@web.de", "Robin.Funie@gmx.net", "Sabrina.Setluar@gmail.com"],
  death_location: "Berlin",
  funeral_location: "Berlin",
  funeral_info: "Please wear something colorful and bring a party hat."
  )

lisa.funeral.representative = simon
lisa.funeral.save


filepath2 = Rails.root.join('db', 'profile_mask.jpg')
lisa.funeral.obituary.photos.attach(io: File.open(filepath2), filename: "Profile_mask.jpg", content_type: "image/jpg")

filepath3 = Rails.root.join('db', 'friends.JPG')
lisa.funeral.obituary.photos.attach(io: File.open(filepath3), filename: "friends.JPG", content_type: "image/jpg")

filepath4 = Rails.root.join('db', 'Kapstadt.JPG')
lisa.funeral.obituary.photos.attach(io: File.open(filepath4), filename: "Kapstadt.JPG", content_type: "image/jpg")

filepath5 = Rails.root.join('db', 'magdeburg.JPG')
lisa.funeral.obituary.photos.attach(io: File.open(filepath5), filename: "magdeburg.JPG", content_type: "image/jpg")

filepath6 = Rails.root.join('db', 'Fachschaft.JPG')
lisa.funeral.obituary.photos.attach(io: File.open(filepath6), filename: "fachschaft.JPG", content_type: "image/jpg")

filepath9 = Rails.root.join('db', 'Patient_will.pdf')
document_patient_will = lisa.funeral.documents.create()
document_patient_will.file.attach(io: File.open(filepath4), filename: "Patient_will.pdf", content_type: "application/pdf")

filepath10 = Rails.root.join('db', 'organ_donor.pdf')
document_patient_will.file.attach(io: File.open(filepath10), filename: "organ_donor.pdf", content_type: "application/pdf")


puts "Funeral seed finished"

puts 'Create condolences'

lisa.funeral.condolences.create!(
first_name: 'Jane',
last_name: 'Doe',
content: 'You were a brilliant coder! Your team misses you!',
funeral: lisa.funeral)

lisa.funeral.condolences.create!(
first_name: 'John',
last_name: 'Smith',
content: 'Giphy Queen! Thank you for all the laughs and jokes.
I miss you and will drink some Aperol Spritz in Memory of you.',
funeral: lisa.funeral)

puts "Condolences seed finished"


puts 'Create funeral locations'

Location.create!(street: 'Am Hafen 20', zip: '25992', city: 'List', name: 'Nordseehafen List/Sylt', cemetery_type: 'Burial at sea')
Location.create!(street: 'Schwedenkai 1', zip: '24103', city: 'Kiel', name: 'Seehafen Kiel', cemetery_type: 'Burial at sea')
Location.create!(street: 'Kopenhagener Str. 3', zip: '23966', city: 'Wismar', name: 'Ostseehafen Wismar', cemetery_type: 'Burial at sea')
Location.create!(street: 'Hafendeichstraße 17', zip: '26465', city: 'Langeoog', name: 'Nordseehafen Langeoog', cemetery_type: 'Burial at sea')

require 'csv'
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath = Rails.root.join('db', 'address_seed5.csv') # previously 'address_seed4.csv'
    CSV.foreach(filepath, csv_options) do |row|
      Location.create!(
          street: row['street'], # previously address_street
          zip: row['zip'], # previously address_zip
          city: row['city'], # previously address_city
          name: row['name'], # previously Faker::Company.name,
          cemetery_type: row['cemetery_type'], # new
        )
    end


puts 'Funeral locations seed finished'
