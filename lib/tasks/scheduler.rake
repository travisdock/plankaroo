require 'date'

def isweekday?(day)
  [1, 2, 3, 4, 5].include?(day)
end

desc "This task is called by the Heroku scheduler add-on"
task :add_daily_event => :environment do
  puts "Updating schedule..."
  if isweekday?(Date.today.wday)
    Event.create(date: DateTime.now.to_date, time: '4:00 pm', where: 'Dumbo Campus')
  end
  puts "done."
end
