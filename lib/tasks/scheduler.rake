desc "This task is called by the Heroku scheduler add-on"
task :add_daily_event => :environment do
  puts "Updating schedule..."
  Event.create(date: DateTime.now.to_date, time: '4:00 pm', where: 'Dumbo Campus')
  puts "done."
end
