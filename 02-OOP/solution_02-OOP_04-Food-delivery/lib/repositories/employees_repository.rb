require 'csv'
require 'models/employee'

class EmployeesRepository
  attr_reader :csv_filename

  def initialize
    @csv_filename = "#{__dir__}/employees.csv"
  end

  def all
    employees
  end

  def find(id)
    id = id.to_i
    employees.find { |employee| employee.id == id }
  end

  def find_by_login_and_password(login, password)
    employees.find do |employee|
      employee.login == login && employee.password == password
    end
  end

  private

  def employees
    records = CSV.read(csv_filename, headers: :first_row, header_converters: :symbol)
    records.map { |record| Employee.new(record) }
  end
end
