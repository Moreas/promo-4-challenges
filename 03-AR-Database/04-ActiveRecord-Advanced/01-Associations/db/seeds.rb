# TODO: Write a seed
require "faker"

5.times do
  user = User.new(
    username: Faker::Name.name,
    email: Faker::Internet.email
  )
  (rand(6) + 5).times do
    post = Post.new(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    votes: (0..100).to_a.sample
      )
    post.user = user
    post.save
  end
  user.save
end

