class Restaurant
  # TODO: add relevant accessors if necessary
  attr_accessor :city, :name, :address, :type_of_food, :average_rating
  def initialize(city, name, address = "", average_rating = 0, number_of_rates = 0)
    # TODO: implement constructor with relevant instance variables
    @city = city
    @name = name
    @address = address
    @type_of_food = type_of_food
    @average_rating = average_rating
    @number_of_rates = number_of_rates
  end

  def self.filter_by_city(restaurants, city)
    restocity = []
    restaurants.each do |resto|
      restocity.push(resto) if resto.city == city
    end
    return restocity
  end

  def rate(rate)
    @average_rating = ((@average_rating * @number_of_rates.to_f) + rate.to_f) / (@number_of_rates.to_f + 1)
    @number_of_rates += 1
    return @average_rating
  end
  # TODO: implement #filter_by_city and #rate methods
end

Perse = Restaurant.new("New York", "Perse", "Canal Street", 0, 0)
jules_verne = Restaurant.new("paris", "Jules Verne")
tour_d_argent = Restaurant.new("paris", "Tour d'argent")
bocuse = Restaurant.new("lyon", "Paul Bocuse")
restos = [Perse, jules_verne, tour_d_argent, bocuse]
p Restaurant.filter_by_city(restos, "paris")

