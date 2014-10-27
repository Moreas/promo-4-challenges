require "faker"

# TODO: Write a seed to insert 100 posts in the database

100.times do
  post = Post.new(
    name: Faker::Lorem.word,
    url: Faker::Internet.url,
    votes: (0..100).to_a.sample
  )
  post.save
end