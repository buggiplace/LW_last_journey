class Funeral < ApplicationRecord
  belongs_to :playlist
  belongs_to :funeral_type
  belongs_to :digital_will
  belongs_to :obituary
  # belongs_to :representative_profile, optional: true
  has_many :condolences, dependent: :destroy
  has_many :documents, dependent: :destroy
  # belongs_to :user
  belongs_to :user, class_name: "User"
  belongs_to :representative, class_name: "User", optional: true
end



