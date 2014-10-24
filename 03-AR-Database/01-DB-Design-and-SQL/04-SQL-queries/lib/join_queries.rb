require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist
  db.execute "SELECT t.name, a.title, r.name FROM tracks t
  JOIN albums a ON (t.album_id = a.id) JOIN artists r ON (a.artist_id = r.id);"
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  result = db.execute "SELECT COUNT(t.name), AVG(t.milliseconds) FROM tracks t
  JOIN genres g ON (t.genre_id = g.id) WHERE g.name = '#{genre_name}'
  GROUP BY g.id;"
  { category: genre_name, number_of_songs: result.flatten[0], avg_length: (result.flatten[1] / 60_000).round(2) }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 rock artists
  db.execute "SELECT a.name, COUNT(t.id)  FROM artists a
  JOIN albums l on (l.artist_id = a.id) JOIN tracks t on (t.album_id = l.id)
  JOIN genres g ON (t.genre_id = g.id) WHERE g.name = '#{genre_name}'
  GROUP BY a.id ORDER BY COUNT(t.id) desc LIMIT 5;"
end