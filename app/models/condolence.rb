class Condolence < ApplicationRecord
  belongs_to :funeral
  validates :first_name, presence: true
  validates :last_name, presence: true
end
