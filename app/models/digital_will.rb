class DigitalWill < ApplicationRecord
  has_one :funeral
  BANKS = ['ING-Group', 'Fidor', 'Comdirect', 'Sparkasse', 'Deutsche Bank', 'Commerzbank', 'n26', 'Postbank', 'Not listed']
  INSURANCE = ['HUK24', 'Getsurance', 'AXA', 'Lemonade', 'Allianz', 'ERGO', 'Generali', 'Not listed']
end
