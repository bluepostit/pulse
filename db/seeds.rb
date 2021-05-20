# Generate pulse statuses

statuses = [
  'safe',
  'in danger',
  'need help',
  'injured'
]


# PulseStatus.destroy_all
if PulseStatus.all.empty?
  puts 'Generating PulseStatus data'
  statuses.each do |status|
    PulseStatus.create(name: status)
  end
end

# Create demo user

demo_user = User.find_by(name: 'demo')
demo_user.destroy unless demo_user.nil?

puts 'Creating demo user with checkins.'
demo_user = User.create!(name: 'demo', email: 'demo@example.com', password: 'R[hF89NN~!;;gN<2j98')

checkin_data = [
  {
    status: 'safe',
    location: 'home',
    message: '',
    date: DateTime.now.midday - 7
  },
  {
    status: 'in danger',
    location: 'home',
    message: 'Situation is tense. Major flooding.',
    date: DateTime.now.change(hour: 11, min: 3, sec: 8) - 5
  },
  {
    status: 'injured',
    location: 'Cityville',
    message: 'Got hit by some debris in the floodwater. Think I sprained my ankle, hard to walk.',
    date: DateTime.now.change(hour: 16, min: 9, sec: 22) - 4
  },
  {
    status: 'need help',
    location: 'Post office, Cityville',
    message: 'A few of us sheltering here. Need food, blankets, water.',
    date: DateTime.now.change(hour: 21, min: 8, sec: 56) - 2
  },
  {
    status: 'safe',
    location: 'home',
    message: 'Flooding down. We found food. Everyone ok. Ankle much better, got help getting home.',
    date: DateTime.now.change(hour: 14, min: 6, sec: 41)
  },
]

checkin_data.each do |data|
  status = PulseStatus.find_by_name(data[:status])
  checkin = demo_user.check_in!(
    status,
    data[:location],
    data[:message]
  )
  checkin.created_at = data[:date]
  checkin.save!
end



puts 'Done.'
