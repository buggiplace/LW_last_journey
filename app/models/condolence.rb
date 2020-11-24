class Condolence < ApplicationRecord
    belongs_to :funeral

    validates :first_name, :last_name, presence: true
end
