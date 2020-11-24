# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Starting seed"

puts "Cleaning old seeds"

Funeral.destroy_all

puts "Adding funerals"

# filepath = "db/preferences.json"
# serialized_preferences = File.read(filepath) #returns a string
# preferences = JSON.parse(serialized_preferences)

Funeral.create!(
  preferences: {
    'funeral_type': {
      'type': 'Peace forest',
      'funeral_comment': 'I would like a lot of white candles at the memorial service',
      'location': 'xxxx'
    },
    'music': {
      'spotify_link': 'https://open.spotify.com/playlist/09vrf9JgCt1AD06mqwlubq?si=Hd9IknaZTQCbIzL6MbxORQ'
    },
    'documents': {
      'Organ donor card': 'https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
      'Last will': 'https://images.unsplash.com/photo-1564069114553-7215e1ff1890?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=889&q=80',
      'doc_comment': 'Original documents can be found in my office desk at the end of the room.'
    },
    'representative': {
      'first_name': 'Simon',
      'last_name': 'Geierbach',
      'email': 'simon.geierbach@gmail.com',
      'rep_comment': 'Hang in there, buddy! Please make sure my parents dont get to see my nude pictures in whatsapp.'
    },
    'digital_will': {
      'cancel_accounts': ['LinkedIn','Spotify','Facebook','Twitter'],
      'facebook_obituary': 'No',
      'bank_accounts': ['Sparkasse ****2456','N26: ****2456', 'Coinbase'],
      'insurance_accounts': ['HUB24: ****2635','Clark: ****4659'],
      'hardware': 'Please destroy my harddrives',
      'dig_comment': 'Yes, you can!'
    },
    'obituary': {
      'last_words': 'Thank you, I had a jolly good time with everyone. On my funeral I would like all of you drink a shot and throw the glasses on the wall! Tschaka!',
      'spotify_list': 'Yes',
      'death_date': '',
      'death_location': '',
      'funeral_time': '',
      'funeral_location': '',
      'funeral_info': '',
      'obituary_quote': '',
      'obituary_intro': '',
      'obituary_relatives': '',
      'obituary_other': ''
    },
  },
  user_id: User.all.sample.id,
)
  # picture_one: row['picture_link'],


puts "User Seed done - x added"

puts "Seed finished"


# Funeral.create!(
#   preferences: {
#     funeral_type: {
#       type: 'forrest funeral',
#       wish_comment: 'free text fiel input'
#     },
#     music: {
#       song_selection: ['ave maria', 'highway to hell'],
#       wish_comment: 'free text field input'
#     }
#   },
#   representative_email: 'hello@gmail.com'
