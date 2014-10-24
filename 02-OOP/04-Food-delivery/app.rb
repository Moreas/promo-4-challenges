<<<<<<< HEAD
require_relative 'customer'
require_relative 'deliveryguy'
require_relative 'employee'
require_relative 'manager'
require_relative 'meal'
require_relative 'order'
require_relative 'restaurant'
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
require_relative 'employeesdb'
require_relative 'ordersdb'
require_relative 'customersdb'
require_relative 'mealsdb'
require_relative 'router'
()
employees_db = EmployeesDB.new()
orders_db = OrdersDB.new()
customers_db = CustomersDB.new()
meals_db = MealsDB.new()
restaurant_controller = RestaurantController.new()
employee_controller = EmployeeController.new(employees_db)
order_controller = OrderController.new(orders_db)
customer_controller = CustomerController.new()
meal_controller = MealController.new(meals_db)




start = Router.new(restaurant_controller, employee_controller, order_controller, customer_controller, meal_controller)
start.run


=======
# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#    $ ruby app.rb
>>>>>>> c457031c26688bdbbf65abe3dcc4c94aac6db830
