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
  dur = end_time - start_time
  correct = included_array(attempt.upcase.split(""), grid.flatten)
  if translate(attempt).nil?
    return { time: dur, translation: nil, score: 0, message: "not an english word" }
  elsif correct
    return { time: dur, translation: translate(attempt), score: attempt.size * 10 - (dur).to_i, message: "well done" }
  else
    return { time: dur, translation: nil, score: 0, message: "not in the grid" }
  end
end

def translate(word)
  result = JSON.parse(open("http://api.wordreference.com/0.8/80143/json/enfr/#{word}").read)
  if result["Error"]
    return nil
  else
    return result["term0"]["PrincipalTranslations"]["0"]["FirstTranslation"]["term"]
  end
end

def included_array(a1, a2)
  correct = true
  i = 0
  while correct && (i < a1.size)
    a2.include?(a1[i]) ? correct = true : correct = false
    i += 1
  end
  return correct
end
