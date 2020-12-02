class DigitalWill < ApplicationRecord
  has_one :funeral
  BANKS = ['ING-Group', 'Fidor', 'Comdirect', 'Sparkasse', 'Deutsche Bank', 'Commerzbank', 'Targobank', 'Postbank', 'Not listed']
  INSURANCE = ['Insurance1', 'Insurance2', 'Insurance3', 'Not listed']
end
