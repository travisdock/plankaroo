every :weekday, at: '12:30 am' do
  runner "Event.create(date: DateTime.now.to_date, time: '4:00 pm', where: 'Dumbo Campus')"
end
