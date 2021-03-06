class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  enum kind: { owner: 0, representative: 1 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture
  has_one :funeral, dependent: :destroy
  # has_many :funeral_as_representative, source: :funerals, foreign_key: :representative_id

  validates :first_name, :last_name, presence: true
  # :birth_date,

  after_create :initialize_funeral

  def funeral_as_representative
    Funeral.find_by(representative_id: self.id)
  end

  private

  def initialize_funeral
    if owner?
      funeral_type = FuneralType.create
      playlist = Playlist.create
      digital_will = DigitalWill.create
      obituary = Obituary.create
      Funeral.create!( funeral_type: funeral_type, playlist: playlist, digital_will: digital_will, obituary: obituary, user: self)
    end
  end


end


  # scope :owners, -> { where(kind: 0) }
  # scope :representatives, -> { where(kind: 1) }
