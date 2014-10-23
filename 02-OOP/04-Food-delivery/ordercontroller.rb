require_relative 'order'

class OrderController

  attr_reader :orders

  def initialize(ordersDB)
    @orders = ordersDB.orders
  end

  def calculate_order_price
  end

  def mark_as_completed
  end

  def assign_order(order, delivery_guy)
    order.assign_to_delivery_guy(delivery_guy)
  end

end

