class Restaurant

  attr_reader :name, :address, :city, :phone_number, :opening_hour, :closing_hour

  def initialize(name, address, city, phone_number, opening_hour, closing_hour)
    @name = name
    @address = address
    @city = city
    @phone_number = phone_number
    @opening_hour = opening_hour
    @closing_hour = closing_hour
    @delivery_guys = {}
    @manager = ""
    @menu =[]
  end

  def is_open?
    t = Time.now
    hour = t.hour
    return hour >= @opening_hour && hour <= @closing_hour
  end

  def add_meal_to_menu(meal)
    @menu << meal
  end

  def define_manager(manager)
    @manager = manager
  end

  def initialize_delivery_guys(delivery_guys)
    @delivery_guys = delivery_guys
  end


end

# resto_1 = Restaurant.new("The Party","398 Hayes St","San Francisco", "+14155511590", 12, 23)
# p resto_1.is_open?