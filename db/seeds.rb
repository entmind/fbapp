# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  email = Faker::Internet.email
	name = Faker::Name.last_name
  password = "password"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password
               )
end

10.times do |n|
  content = Faker::Pokemon.content
  Topic.create!(content: content)
end

10.times do |n|
  comment = Faker::Pokemon.comment
  Comment.create!(comment: comment)
end
