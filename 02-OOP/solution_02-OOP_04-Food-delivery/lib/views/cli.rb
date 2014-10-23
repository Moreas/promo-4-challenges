require 'controllers/customers_controller'
require 'controllers/employees_controller'
require 'controllers/orders_controller'
require 'controllers/restaurant_controller'

require 'services/employees_auth_service'

class CLI
  attr_reader :auth_service, :controllers, :router, :signed_in_employee

  def initialize
    @auth_service = EmployeesAuthService.new(self)
    @controllers = {
      customers: CustomersController.new(self),
      employees: EmployeesController.new(self),
      orders: OrdersController.new(self),
      restaurant: RestaurantController.new(self)
    }
    @exit = false
  end

  def ask(prompt)
    print "#{prompt} "
    gets.to_s.chomp
  end

  def run
    line
    controllers[:restaurant].welcome
    line
    @signed_in_employee = auth_service.authenticate
    # useful to bypass login
    # @signed_in_employee = Employee.new(id: 42, login: '...', password: '...', role: 'manager')
    welcome_employee
    listen_for_commands
  end

  def line(length = 30)
    display '-' * length
  end

  def display(message)
    puts message
  end

  private

  def welcome_employee
    line
    display "Welcome, #{signed_in_employee.login}. Your access level is: #{signed_in_employee.role.upcase}"
  end

  def exit!
    @exit = true
  end

  def exit?
    @exit
  end

  def listen_for_commands
    until exit?
      display_menu
      command = ask('>')
      handle_command(command)
    end
  end

  def display_menu
    line
    display 'What would you like to do?'

    if signed_in_employee.manager?
      display <<-END.gsub(/^\s+/, '')
        * list customers
        * add customer
        * view orders <customer_id>
        * add order <customer_id>, <employee_id_>
        * remove order <order_id>
        * list employees
        * log out
      END
    else
      display <<-END.gsub(/^\s+/, '')
        * view orders
        * complete order <order_id>
        * log out
      END
    end
  end

  def handle_command(command)
    line
    if signed_in_employee.manager?
      handle_manager_command(command)
    else
      handle_delivery_guy_command(command)
    end
  end

  def handle_manager_command(command)
    case command
    when 'list customers'           then controllers[:customers].index
    when 'add customer'             then controllers[:customers].create
    when /^view orders (\d+)$/      then controllers[:orders].index($1)
    when /^add order (\d+), (\d+)$/ then controllers[:orders].create($1, $2)
    when /^remove order (\d+)$/     then controllers[:orders].destroy($1)
    when 'list employees'           then controllers[:employees].index
    when 'log out'                  then exit!
    else command_not_found(command)
    end
  end

  def handle_delivery_guy_command(command)
    case command
    when 'view orders'              then controllers[:orders].for_employee(signed_in_employee.id)
    when /^complete order (\d+)$/   then controllers[:orders].destroy($1)
    when 'log out'                  then exit!
    else command_not_found(command)
    end
  end

  def command_not_found(command)
    display "Command '#{command}' was not found!"
  end
end
