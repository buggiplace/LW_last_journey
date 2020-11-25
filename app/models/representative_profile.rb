class RepresentativeProfile < ApplicationRecord
  belongs_to :user
  has_many :funerals
end
