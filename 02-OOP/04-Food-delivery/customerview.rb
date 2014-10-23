require_relative 'customercontroller'

class CustomerView

  def display_customer(customer)
    puts "> ID: #{customer["id"]} -- NAME: #{customer["name"]} -- ADDRESS: #{customer["address"]}"
  end

  def add_customer_name
    puts "Please enter customer name:"
    name = gets.chomp
  end

  def add_customer_address
    puts "Please enter customer address:"
    address = gets.chomp
  end

end