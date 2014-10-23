require 'repositories/customers_repository'
require 'repositories/employees_repository'
require 'repositories/meals_repository'
require 'repositories/orders_repository'

class OrdersController
  attr_reader :customers_repository,
              :employees_repository,
              :meals_repository,
              :orders_repository,
              :view

  def initialize(view)
    @view = view
    @customers_repository = CustomersRepository.new
    @employees_repository = EmployeesRepository.new
    @meals_repository = MealsRepository.new
    @orders_repository = OrdersRepository.new
  end

  def index(customer_id)
    orders = orders_repository.find_by_customer_id(customer_id)

    orders.each do |order|
      view.display order
      view.line(15)
    end
  end

  def for_employee(employee_id)
    orders = orders_repository.find_by_employee_id(employee_id)

    orders.each do |order|
      view.display order
      view.line(15)
    end
  end

  def create(customer_id, employee_id)
    meals = meals_repository.all

    view.display 'What meal(s) did the customer order? (space separated list of ids)'
    meals.each { |meal| view.display meal }
    meal_ids = view.ask('Meals:')
    orders_repository.create(customer_id: customer_id, employee_id: employee_id, meal_ids: meal_ids)

    view.line
    view.display 'Placing order:'
    view.display orders_repository.last
  end

  def destroy(order_id)
    orders_repository.destroy(order_id)
    view.display "Order #{order_id} removed!"
  end
end
