class Funeral < ApplicationRecord
  belongs_to :playlist
  belongs_to :funeral_type
  belongs_to :digital_will
  belongs_to :obituary
  belongs_to :representative_profile, optional: true
  has_many :condolences
  has_many :documents
  belongs_to :user
end
