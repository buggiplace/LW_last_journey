class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :funeral, dependent: :destroy
  # has_one :representative_profile, optional: :true
  has_one_attached :profile_picture

  validates :first_name, :last_name, presence: true
  # :birth_date,

  after_create :initialize_funeral
  private

  def initialize_funeral
    if representative == false
      funeral_type = FuneralType.create
      playlist = Playlist.create
      digital_will = DigitalWill.create
      obituary = Obituary.create
      Funeral.create!( funeral_type: funeral_type, playlist: playlist, digital_will: digital_will, obituary: obituary, user: self)
    end
  end
end
