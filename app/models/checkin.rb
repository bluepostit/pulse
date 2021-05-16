class Checkin < ApplicationRecord
  belongs_to :user
  belongs_to :pulse_status

  validates :location, length: { maximum: 140 }
  validates :message, length: { maximum: 140 }
end
