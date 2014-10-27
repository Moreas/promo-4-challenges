# You can use a global variable, DB, built as is:
# DB = SQLite3::Database.new(file)

class Post
  attr_reader :id, :date, :votes
  attr_accessor :title, :url

  def initialize(options = {})
    @title = options[:title]
    @url = options[:url]
    @date = options[:date] || Time.now
    @votes = options[:votes] || 0
    @id = options[:id]
  end

  def self.all
    rows = DB.execute('SELECT * FROM posts')
    rows.map do |row|
      load_from_row(row)
    end
  end

  def self.find(id)
    statement = DB.prepare('SELECT * FROM posts WHERE id = ?')
    statement.bind_param 1, id
    row = statement.execute.first
    statement.close
    load_from_row(row) if row
  end

  def upvote
    @votes += 1
  end

  def save
    @id ? update : insert
  end

  def destroy
    statement = DB.prepare('DELETE FROM posts WHERE id = ?')
    statement.bind_param 1, @id
    statement.execute
  end

  private

  def self.load_from_row(row)
    options = {
      id: row[0],
      title: row[1],
      url: row[2],
      date: Time.at(row[3]),
      votes: row[4]
    }
    Post.new(options)
  end

  def update
    statement = DB.prepare(
      'UPDATE posts SET title = ?, url = ?, date = ?, votes = ? WHERE id = ?')
    bind_params(statement)
    statement.bind_param 5, @id if @id
    statement.execute
  end

  def insert
    statement = DB.prepare(
      'INSERT INTO posts (title, url, date, votes) VALUES (?, ?, ?, ?)')
    bind_params(statement)
    statement.execute
    @id = DB.last_insert_row_id
  end

  def bind_params(statement)
    statement.bind_param 1, @title
    statement.bind_param 2, @url
    statement.bind_param 3, @date.to_i
    statement.bind_param 4, @votes
  end
end