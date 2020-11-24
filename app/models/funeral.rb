class Funeral < ApplicationRecord
  belongs_to :user

  # validates :representative_email, presence: true, format: {with /\A[^@\s]+@[^@\s]+\z/}
  serialize :preferences

  has_many :condolences, dependent: :destroy

  validates :representative_email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }, allow_blank: true
end
