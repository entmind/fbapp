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
  uid = "#{n + 1}"
  provider = "twitter"
  User.create!(email: email,
               name: name,
               password: password,
               password_confirmation: password,
               uid: uid,
               provider: provider
               )
end

10.times do |n|
  content = Faker::Pokemon.name
  user_id = "#{n + 1}"
  Topic.create!(content: content,
                user_id: user_id
                )
end

10.times do |n|
  content = Faker::Pokemon.location
  user_id = "#{n + 1}"
  topic_id = "#{n + 1}"
  Comment.create!(content: content,
                  user_id: user_id,
                  topic_id: topic_id
                  )
end

10.times do |n|
  sender_id =  "#{n + 1}"
  recipient_id = "#{n + 2}"
  Conversation.create!(sender_id: sender_id,
                recipient_id: recipient_id
                )
end

10.times do |n|
  body = Faker::Music.instrument
  conversation_id = "#{n + 1}"
  user_id = "#{n + 1}"
  Message.create!(body: body,
                conversation_id: conversation_id,
                user_id: user_id
                )
end
