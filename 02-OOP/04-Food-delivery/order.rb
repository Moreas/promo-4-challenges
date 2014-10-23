class Order

  def initialize(meals, customer)
    @id =
    @meals = meals
    @customer = customer
    @total_price = 0
    @date = Time.now
    @hour = Time.now.hour
    @completed = false
    @delivery_guy = ""
  end

  def assigned_to_delivery_guy(delivery_guy)
    @delivery_guy = delivery_guy
  end

end
