class Restaurant
  attr_accessor :name, :food_type, :address, :nb_places
  def initialize(name, food_type, address, nb_places)
    @name = name
    @food_type = food_type
    @address = address
    @nb_places = nb_places
  end
end