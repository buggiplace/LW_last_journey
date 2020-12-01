# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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


puts 'Create 2 demo accounts'
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

puts 'Create 1 funeral'

lisa.funeral.funeral_type.update(
  burial_type: 'Burial',
  comment: 'Please no flowers. I really hate flowers',
  loc_street: 'Giersstrasse 19',
  loc_zip: '13088',
  loc_city: 'Berlin')
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
  last_words: 'Thank you for a wonderful life. Keep on rockin!'
  )
lisa.funeral.representative = simon
lisa.funeral.save

# simon.funeral = funeral


# Funeral.create!(
#   preferences: {
#     'teststring': "test123",
#     'funeral_type': {
#       'type': 'Peace forest',
#       'funeral_comment': 'I would like a lot of white candles at the memorial service',
#       'location': 'xxxx'
#     },
#     'music': {
#       'spotify_link': 'https://open.spotify.com/playlist/09vrf9JgCt1AD06mqwlubq?si=Hd9IknaZTQCbIzL6MbxORQ'
#     },
#     'documents': {
#       'Organ_donor_card': 'https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
#       'Last_will': 'https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
#       'doc_comment': 'Original documents can be found in my office desk at the end of the room.'
#     },
#     'representative': {
#       'first_name': 'Simon',
#       'last_name': 'Geierbach',
#       'email': 'simon.geierbach@gmail.com',
#       'rep_comment': 'Hang in there, buddy! Please make sure my parents dont get to see my nude pictures in whatsapp.'
#     },
#     'digital_will': {
#       'cancel_accounts': ['LinkedIn', 'Spotify', 'Facebook', 'Twitter'],
#       'facebook_obituary': 'No',
#       'bank_accounts': ['Sparkasse ****2456', 'N26: ****2456', 'Coinbase'],
#       'insurance_accounts': ['HUB24: ****2635', 'Clark: ****4659'],
#       'hardware': 'Please destroy my harddrives',
#       'dig_comment': 'Yes, you can!'
#     },
#     'obituary': {
#       'last_words': 'Thank you, I had a jolly good time with everyone. On my funeral I would like all of you drink a shot and throw the glasses on the wall! Tschaka!',
#       'spotify_list': 'Yes',
#       'death_date': '',
#       'death_location': '',
#       'funeral_time': '',
#       'funeral_location': '',
#       'funeral_info': '',
#       'obituary_quote': '',
#       'obituary_intro': '',
#       'obituary_relatives': '',
#       'obituary_other': ''
#     }
#   },
#   user: lena
# )
# picture_one: row['picture_link'],

puts "Funeral seed finished"

puts 'Create condolences'


# funeral.condolences.create!(first_name: 'Jane', last_name: 'Doe')
# funeral.condolences.create!(first_name: 'John', last_name: 'Smith')

puts "Condolences seed finished"


puts 'Create funeral locations'

Location.create!(street: 'Am Hafen 20', zip: '25992', city: 'List', name: 'Nordseehafen List/Sylt', cemetery_type: 'Burial at sea 🌊')
Location.create!(street: 'Schwedenkai 1', zip: '24103', city: 'Kiel', name: 'Seehafen Kiel', cemetery_type: 'Burial at sea 🌊')
Location.create!(street: 'Kopenhagener Str. 3', zip: '23966', city: 'Wismar', name: 'Ostseehafen Wismar', cemetery_type: 'Burial at sea 🌊')
Location.create!(street: 'Hafendeichstraße 17', zip: '26465', city: 'Langeoog', name: 'Nordseehafen Langeoog', cemetery_type: 'Burial at sea 🌊')

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
