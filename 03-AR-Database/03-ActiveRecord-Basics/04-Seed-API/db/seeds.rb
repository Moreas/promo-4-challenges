require "json"
require "rest-client"

response = JSON.parse(RestClient.get 'https://hacker-news.firebaseio.com/v0/topstories.json')
response[0..9].each do |i|
  uri = "https://hacker-news.firebaseio.com/v0/item/#{i}.json"
  post_info = JSON.parse(RestClient.get uri)
  post = Post.new(
  name: post_info[:title],
  url: post_info[:url],
  votes: post_info[:score]
    )
  post.save
end

# TODO: Write a seed to insert 100 posts in the database fetched from the Hacker News API.}