# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user1 = User.new(email: "exemple@gmail.com", password: "exemple")
user1.save
user = User.new(email: "caio@gmail.com", password: "Gorillaz1")
user.save

20.times do
    name = Faker::Name.name
    description = Faker::ChuckNorris.fact
    channel = user1.channels.build(name: name, description: description, image: Rails.root.join("public/uploads/channel/image/test.jpg").open)
    channel.save
    Subscription.create(subscriber_id: user.id, channel_id: channel.id)
end