every :weekday, at: '5:05 pm' do
  runner "Event.create(date: DateTime.now.to_date, time: '4:00 pm', where: 'Dumbo Campus')"
end
