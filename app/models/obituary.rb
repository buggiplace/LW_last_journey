class Obituary < ApplicationRecord
  has_one :funeral
  has_rich_text :rich_body
  has_many_attached :photos
end
