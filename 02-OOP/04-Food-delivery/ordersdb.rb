require 'json'

class OrdersDB

  attr_reader :orders

  def initialize
    filepath = './orders.json'
    orders = File.open(filepath).read
    @orders = JSON.parse(orders)
  end

  def update(id)
    filepath = './orders.json'
    orders = File.open(filepath).read
    @orders = JSON.parse(orders)
    @orders[]
  end

  def gen_id
    @orders.map{|i| i.id}.max + 1
  end

end

# test = OrdersDB.new()
# p test