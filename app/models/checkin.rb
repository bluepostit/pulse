class Checkin < ApplicationRecord
  belongs_to :user
  belongs_to :pulse_status
end
