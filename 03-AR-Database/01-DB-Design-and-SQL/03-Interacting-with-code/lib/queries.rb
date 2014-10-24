require 'sqlite3'


def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  result = db.execute "SELECT COUNT(*) FROM #{table_name}"
  return result.join("").to_i
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  result = db.execute "SELECT name FROM artists ORDER BY name ASC"
  result.flatten
end

def love_tracks(db)
  # TODO: return array of love songs
  result = db.execute "SELECT name FROM tracks WHERE name LIKE '%love%' ORDER BY name ASC"
  result.flatten
end

def long_tracks(db, min_length)
  # TODO: return tracks verifying: duration > min_length (minutes)
  min_length *= 60_000
  result = db.execute "SELECT name FROM tracks WHERE milliseconds > #{min_length} ORDER BY milliseconds ASC"
  result.flatten
end

# db = SQLite3::Database.new db_name
# table_name = "tracks"
# p long_tracks(db, 2000000)
