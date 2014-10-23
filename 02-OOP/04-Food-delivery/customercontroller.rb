require_relative 'customerview'
require_relative 'customersdb'

class CustomerController

attr_reader :customers, :customer_view

  def initialize()
    @customer_view = CustomerView.new()
  end

  def list_customers()
    customersDB = CustomersDB.new()
    customers = customersDB.customers
    customers.each { |customer|  customer_view.display_customer(customer)}
  end

  def add_customer()
    customersDB = CustomersDB.new()
    customers = customersDB.customers
    name = @customer_view.add_customer_name
    address = @customer_view.add_customer_address
    customers << {id: customersDB.gen_id, name: name, address: address}
    customersDB.add(customers)
  end

end