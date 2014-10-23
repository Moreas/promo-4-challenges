require 'csv'
require 'models/order'

class OrdersRepository
  attr_reader :csv_filename,
              :customers_repository,
              :employees_repository,
              :meals_repository

  def initialize
    @csv_filename = "#{__dir__}/orders.csv"

    @customers_repository = CustomersRepository.new
    @employees_repository = EmployeesRepository.new
    @meals_repository = MealsRepository.new
  end

  def create(args = {})
    args[:id] ||= next_id
    orders << Order.new(order_args(args))
    write_csv
  end

  def destroy(order_id)
    order_id = order_id.to_i
    orders.delete_if { |order| order.id == order_id }
    write_csv
  end

  def find_by_customer_id(customer_id)
    customer_id = customer_id.to_i
    orders.select { |order| order.customer_id == customer_id }
  end

  def find_by_employee_id(employee_id)
    employee_id = employee_id.to_i
    orders.select { |order| order.employee_id == employee_id }
  end

  def last
    orders.last
  end

  private

  def next_id
    orders.map(&:id).max.to_i + 1
  end

  def orders
    records = CSV.read(csv_filename, headers: :first_row, header_converters: :symbol)
    @orders = records.map { |record| Order.new(order_args(record)) }
  end

  def order_args(args)
    {
      id: args[:id].to_i,
      customer: customers_repository.find(args[:customer_id]),
      employee: employees_repository.find(args[:employee_id]),
      meals: meals_repository.find_all(args[:meal_ids].split)
    }
  end

  def write_csv
    CSV.open(csv_filename, 'w') do |csv|
      csv << %w[id customer_id employee_id meal_ids]
      @orders.each do |order|
        csv << [order.id, order.customer_id, order.employee_id, order.meal_ids]
      end
    end
  end
end
