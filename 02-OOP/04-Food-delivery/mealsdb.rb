require 'json'

class MealsDB

  attr_reader :meals

  def initialize
    filepath = './meals.json'
    meals = File.open(filepath).read
    @meals = JSON.parse(meals)
  end

  def gen_id
    @meals.map{|i| i.id}.max + 1
  end

end

# test = MealsDB.new()
# p test.meals
