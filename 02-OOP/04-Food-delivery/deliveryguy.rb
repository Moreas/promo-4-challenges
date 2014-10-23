require_relative 'employee'

class DeliveryGuy < Employee

  def initialize(username, password)
    super
    @assigned_orders = []
    @status = "delivery_guy"
  end

  def assign_order(order)
    @assigned_orders << order
  end

end

# tom = DeliveryGuy.new("tom","password")
# p tom