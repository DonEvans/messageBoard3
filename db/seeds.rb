# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a main sample user.
User.create!(name: "Example User",
              textColor: "red",
              font: "Verdana",
              password: "foobar",
              password_confirmation: "foobar")

# Generate a bunch of additional users.
99.times do |n|
  name = Faker::Name.name
  colors = %w( aqua olive orange red silver teal yellow white )
  fonts = %w(Bad Script, Coming Soon, Fondamento, Lora, Open Sans, Ubuntu)
  textColor = colors[rand(8)]
  font = fonts[rand(6)]
  password = "password"
  User.create!(name: name,
                textColor: textColor,
                font: font,
                password: password,
                password_confirmation: password)
end

# Generate topics for a subset of users
users = User.order(:created_at).take(10)
users.each do |user|
  title = Faker::Lorem.sentence(word_count: 2)
  user.topics.create!(title: title)
  #Generate posts for each topic
  topics = Topic.all
  topics.each do |topic|
    content = Faker::Lorem.sentence(word_count: 20)
    topic_id = topic.id
    user.messages.create!(content: content, topic_id: topic_id)
  end
end


