class Obituary < ApplicationRecord
  has_one :funeral
  has_rich_text :rich_body
end
