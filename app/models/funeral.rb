class Funeral < ApplicationRecord
  belongs_to :user

  # validates :representative_email, presence: true, format: {with /\A[^@\s]+@[^@\s]+\z/}
  serialize :preferences
end
