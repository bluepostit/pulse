# Generate pulse statuses

statuses = [
  'safe',
  'in danger',
  'need help',
  'injured'
]


PulseStatus.destroy_all
statuses.each do |status|
  PulseStatus.create(name: status)
end
