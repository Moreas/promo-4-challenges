require 'open-uri'
require 'json'

def generate_grid(grid_size)
  # TODO: generate random grid of letters
  grid = []
  (0..grid_size - 1).each { grid.push(('A'..'Z').to_a.sample(1)) }
  return grid
end

def run_game(attempt, grid, start_time, end_time)
  # TODO: runs the game and return detailed hash of result
  attempt = attempt.upcase
  result = JSON.parse(open("http://api.wordreference.com/0.8/80143/json/enfr/#{attempt}").read)
  correct = true
  score = attempt.size * 10 - (end_time - start_time).to_i
  i = 0
  while correct && (i < attempt.size)
    grid.flatten.include?(attempt.split("")[i]) ? correct = true : correct = false
    i += 1
  end
  if result["Error"] == "NoTranslation"
    score = 0
    message = "not an english word"
    translation = nil
  else
    if correct
      translation = result["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
      message = "well done"
    else
      score = 0
      message = "not in the grid"
      translation = nil
    end
  end
  return { time: end_time - start_time, translation: translation, score: score, message: message }
end