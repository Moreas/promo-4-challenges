require 'csv'
require 'models/customer'

class CustomersRepository
  attr_reader :csv_filename

  def initialize
    @csv_filename = "#{__dir__}/customers.csv"
  end

  def all
    customers
  end

  def create(args = {})
    args[:id] ||= next_id
    customers << Customer.new(args)
    write_csv
  end

  def find(id)
    id = id.to_i
    customers.find { |customer| customer.id == id }
  end

  def last
    customers.last
  end

  private

  def next_id
    customers.map(&:id).max.to_i + 1
  end

  def customers
    records = CSV.read(csv_filename, headers: :first_row, header_converters: :symbol)
    @customers = records.map { |record| Customer.new(record) }
  end

  def write_csv
    CSV.open(csv_filename, 'w') do |csv|
      csv << %w[id name address phone]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address, customer.phone]
      end
    end
  end
end
