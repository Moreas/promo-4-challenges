require 'json'

class EmployeesDB

  attr_reader :employees

  def initialize
    filepath = './employees.json'
    employees = File.open(filepath).read
    @employees = JSON.parse(employees)["employees"]
  end

  def gen_id
    @employees.map{|i| i.id}.max + 1
  end
end

# test = EmployeesDB.new()
# p test.employees