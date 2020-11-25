class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :funeral, dependent: :destroy

  has_one_attached :profile_picture

  validates :first_name, :last_name, :birth_date, presence: true
end
