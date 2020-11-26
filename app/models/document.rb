class Document < ApplicationRecord
  belongs_to :funeral
  has_one_attached :file
end
