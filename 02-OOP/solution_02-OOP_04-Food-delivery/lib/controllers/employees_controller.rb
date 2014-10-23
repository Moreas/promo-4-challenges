class EmployeesController
  attr_reader :employees_repository, :view

  def initialize(view)
    @view = view
    @employees_repository = EmployeesRepository.new
  end

  def index
    employees = employees_repository.all
    employees.each do |employee|
      view.display employee
    end
  end
end
