# You can use a global variable, DB, built as is:
# FILE = '/home/florent/code/Moreas/promo-4-challenges/03-AR-Database/02-SQL-CRUD/db/posts.db'
# DB = SQLite3::Database.new(file)

require 'time'

class Post
  # TODO: implement some reader and/or writers
  attr_reader :id, :date, :title, :date, :votes, :url

  def initialize(options = {})
    # TODO: initialize instance variables from the hash options.
    @title = options[:title]
    @url = options[:url]
    @id = options[:id]
    @date = Time.now
    @votes = 0
  end

  def title=(title)
    @title = title
  end

  def url=  (url)
    @url = url
  end

  def upvote
    @votes += 1
  end

  def save
    exists = DB.execute "SELECT id FROM posts WHERE id = '#{@id}'"
    if exists.first != nil
      @title = "#{@title} updated"
    end
    DB.execute "INSERT INTO posts (title, url, date, votes) VALUES ('#{@title}', '#{@url}', '#{@date}', #{@votes})"
    @id = DB.last_insert_row_id
  end

  def self.find(id)
    result = DB.execute "SELECT id, title, url, date, votes FROM posts WHERE id=#{id}"
    return Post.new({id: result.flatten[0], title: result.flatten[1], url: result.flatten[2], date: result.flatten[3], votes: result.flatten[4]})
  end

  def self.all
    results = DB.execute("SELECT * FROM posts;")

    results.map do |result|
      Post.new({id: result.flatten[0], title: result.flatten[1], url: result.flatten[2], date: result.flatten[3], votes: result.flatten[4]})
    end
  end

  # TODO: implement all the class methods and instance methods
  #       to have a full CRUD support on your Post model
end

  # `id`  INTEGER PRIMARY KEY AUTOINCREMENT,
  # `title` TEXT,
  # `url` TEXT,
  # `date`  INTEGER,
  # `votes`  INTEGER