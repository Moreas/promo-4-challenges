# Encoding: utf-8
require 'csv'

def most_successfull(number, max_year, file_name)
  # TODO: return the number most successfull movies max_year
  csv_options = { col_sep: ',', encoding: "utf-8" }
  tab_movies = []
  CSV.foreach(file_name, csv_options) do |row|
    movies = { name: row[0], year: row[1].to_i, earnings: row[2].to_i }
    tab_movies << movies
  end
  result = tab_movies.select { |movie| movie[:year] < max_year }
  result.sort { |x, y| x[:earnings] <=> y[:earnings] }
  return result.first(number)
end
