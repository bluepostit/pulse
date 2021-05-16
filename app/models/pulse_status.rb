class PulseStatus < ApplicationRecord
  def display_name
    name.capitalize
  end
end
