# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  Cohort.create(name: Faker::Team.name, motto: Faker::MostInterestingManInTheWorld.quote)
end

20.times do
  User.create(name: Faker::Name.name, cohort_id: rand(1..3))
end

5.times do
  Event.create(date: Faker::Time.forward(10, :afternoon), time: Faker::Time.forward(10, :afternoon), where: Faker::Address.country)
end
