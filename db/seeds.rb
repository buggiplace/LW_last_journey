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

# filepath = "db/preferences.json"
# serialized_preferences = File.read(filepath) #returns a string
# preferences = JSON.parse(serialized_preferences)

# puts 'Create users'
# user = User.create!(email: "lucas@test.com", password: "123456")
# puts "User Seed done - x added"


puts 'Create 2 demo accounts'
simon = User.create!(first_name: 'Simon',
                     last_name: 'Lacroix',
                     birth_date: Date.new(1989, 2, 1),
                     email: "simon@test.com",
                     password: "123456789",
                     representative: true)
lena = User.create!(first_name: 'Lena',
                    last_name: 'Link',
                    birth_date: Date.new(1978, 3, 3),
                    email: "lena@test.com",
                    password: "12345678",
                    representative: false)
# funeral = Funeral.create!(user: lena, representative_email: simon.email)



puts 'Create funerals'

puts 'Create 1 funeral'

funeral_type = FuneralType.create
playlist = Playlist.create
digital_will = DigitalWill.create
obituary = Obituary.create

funeral = Funeral.create!( funeral_type: funeral_type, playlist: playlist, digital_will: digital_will, obituary: obituary, user: simon)


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
