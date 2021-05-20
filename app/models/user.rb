class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         # rm until email set up:
         #  :recoverable,
         :rememberable, :validatable

  validates :name, presence: true,
                   length: { minimum: 1 },
                   uniqueness: true
  has_many :checkins, dependent: :destroy

  def latest_checkins(count = 5)
    checkins.order(created_at: :desc).limit(count)
  end

  def check_in!(pulse_status, location = '', message = '')
    Checkin.create!(user: self,
                    pulse_status: pulse_status,
                    location: location,
                    message: message)
  end
end
