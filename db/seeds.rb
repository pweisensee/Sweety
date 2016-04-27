# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reading.destroy_all
Report.destroy_all
User.destroy_all

10.times do |index|
  User.create!(email: "u#{index}@gmail.com",
              name: "user#{index}",
              password: "test1234")
end

test_user = User.first

150.times do
  reading = Reading.create!(user_id: test_user.id,
                  glucose_level: (rand(280) + 10))
  created = (rand*75).days.ago
  reading.created_at = created
  reading.created_on = created
  reading.save
end

Report.create!(user_id: test_user.id,
              start_date: Date.today,
               end_date: Date.today)

Report.create!(user_id: test_user.id,
               start_date: Date.today.beginning_of_month,
               end_date: Date.today)

Report.create!(user_id: test_user.id,
               start_date: 3.months.ago.beginning_of_month,
               end_date: Date.today)

p "Created #{Reading.count} readings, #{Report.count} reports, #{User.count} users"
