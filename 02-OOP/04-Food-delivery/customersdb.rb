require 'json'

class CustomersDB

  attr_reader :customers

  FILEPATH = './customers.json'

  def initialize
    customers = File.open(FILEPATH).read
    @customers = JSON.parse(customers)
  end

  def add(customers)
    customers = File.open(FILEPATH,"w") do |f|
      f.write(customers.to_json)
    end
  end

  def gen_id
    @customers.map{|i| i['id']}.max + 1
  end

end

# test = CustomersDB.new()
# p test.customers
