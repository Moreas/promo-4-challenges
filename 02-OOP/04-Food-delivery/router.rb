require_relative 'restaurantcontroller'
require_relative 'employeecontroller'
require_relative 'ordercontroller'
require_relative 'customercontroller'
require_relative 'mealcontroller'
require_relative 'restaurantview'
require_relative 'employeeview'
require_relative 'orderview'
require_relative 'mealview'
require_relative 'customerview'

class Router

  def initialize(restaurant_controller, employee_controller, order_controller, customer_controller, meal_controller)
    @restaurant_controller = restaurant_controller
    @employee_controller = employee_controller
    @order_controller = order_controller
    @customer_controller = customer_controller
    @meal_controller = meal_controller
    @employee_view = EmployeeView.new()
    @running = true
  end

  def run()
    the_party = Restaurant.new("The Party","398 Hayes St","San Francisco", "+14155511590", 12, 23)
    puts "################ WELCOME TO #{the_party.name.upcase} ######################"
    puts "            --"
    role = @employee_view.login(@employee_controller)
    while @running
      puts "What would you like to do?"
      if role == "manager"
        display_tasks_manager
        action = gets.chomp.to_i
        route_action_manager(action)
      else
        display_tasks_delivery_guy
        action = gets.chomp.to_i
        route_action_delivery_guy(action)
      end
    end

  end

  def route_action_manager(action)
    case action
    when 1 then
      @customer_controller.list_customers
    when 2 then
      @customer_controller.add_customer()
    when 3 then
      p "3 a developper"
    when 4 then
      p "4 a developper"
    when 5 then
      p "5 a developper"
    when 6 then
      p "6 a developper"
    when 7 then
      p "Merci pour ce bon moment!"
      system "clear"
      role = @employee_view.login(@employee_controller)
    end
  end

  def route_action_delivery_guy(action)
    case action
    when 1 then
      p "1 a developper"
    when 2 then
      p "2 a developper"
    when 3 then
      p "Merci pour ce bon moment!"
      system "clear"
      role = @employee_view.login(@employee_controller)
    end
  end

  def display_tasks_manager()
    puts "> 1. List customers"
    puts "> 2. Add customer"
    puts "> 3. View orders <customer_id>"
    puts "> 4. Add order <customer_id>, <employee_id_>"
    puts "> 5. Remove order <order_id>"
    puts "> 6. List employees"
    puts "> 7. Log out"
  end

    def display_tasks_delivery_guy()
    puts "> 1. View orders"
    puts "> 2. Complete order <order_id>"
    puts "> 3. Log out"
  end
    # while @running

    # end
end





