require_relative 'order'
require_relative 'deliveryguy'
require_relative 'restaurant'
require_relative 'employeesdb'
require_relative 'employeeview'

class EmployeeController

  attr_reader :employees, :employeeview

  def initialize(employeesDB)
    @employees = employeesDB.employees
    @employeeview = EmployeeView.new()
  end

  def assign_order(order, delivery_guy)
    order.assign_to_delivery_guy(delivery_guy)
  end

  def fetch_and_print_orders(delivery_guy)
    return employees.assigned_orders
  end

  def fetch_and_print_delivery_guys()
  end

  def authentification(username, password)
    result = @employees.find { |employee| employee["password"] == password && employee["username"] == username }
    if result != nil
      return result["role"]
    else
      return false
    end

  end

end