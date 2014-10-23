require_relative 'meal'

class MealController

  attr_reader :meals

  def initialize(mealsDB)
    @meals = mealsDB.meals
  end

end