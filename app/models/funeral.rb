class Funeral < ApplicationRecord
  belongs_to :user
  has_many :condolences
end
