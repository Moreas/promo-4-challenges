require_relative "restaurant"

class RestaurantController

  def initialize
    my_resto = Restaurant.new("The Party","398 Hayes St","San Francisco", "+14155511590", 12, 23)
    # my_resto.initialize_delivery_guys(delivery_guys)
  end

end