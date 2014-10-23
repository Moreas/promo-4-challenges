require 'models/restaurant'

class RestaurantController
  attr_reader :view, :restaurant

  def initialize(view)
    @view = view
    @restaurant = Restaurant.new('Le Wagon')
  end

  def welcome
    view.display "Welcome to #{restaurant.name}"
  end
end
