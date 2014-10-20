require_relative 'controller'

class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to the Cookbook!"
    puts "           --           "
    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  def stop
    @running = false
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.parse
    when 2 then @controller.list
    when 3 then @controller.create
    when 4 then @controller.destroy
    when 5 then stop
    else puts "Please press 1, 2, 3 or 4"
    end
  end

  def display_tasks
    puts ""
    puts "What do you want to do next?"
    puts "1 - Import recipes from marmiton"
    puts "2 - List all recipes"
    puts "3 - Create a new recipe"
    puts "4 - Destroy a recipe"
    puts "5 - Stop and exit the program"
  end
end