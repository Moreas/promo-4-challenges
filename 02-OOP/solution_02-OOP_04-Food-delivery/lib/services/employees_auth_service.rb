require 'repositories/employees_repository'

class EmployeesAuthService
  attr_reader :employees_repository, :view

  def initialize(view)
    @view = view
    @employees_repository = EmployeesRepository.new
  end

  def authenticate
    begin
      login = view.ask('Login:')
      password = view.ask('Password:')
      employee = employees_repository.find_by_login_and_password(login, password)
    end until employee
    employee
  end
end
