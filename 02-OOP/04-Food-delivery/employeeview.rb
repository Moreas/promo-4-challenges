require_relative 'employeecontroller'

class EmployeeView

  def ask_for_username()
    puts "What is your username?"
    username = gets.chomp
  end

  def ask_for_password()
    puts "What is your password?"
    password = gets.chomp
  end

  def login(employeecontroller)
    username = ask_for_username
    password = ask_for_password
    while employeecontroller.authentification(username, password) == false
      wrong_password
        username = ask_for_username
        password = ask_for_password
    end
    role = employeecontroller.authentification(username, password)
    correct_login(username, role)
    return role
  end

  def correct_login(username, role)
    puts "Hello #{username}, you are logged as #{role}"
  end

  def wrong_password()
    puts "Your login info is not correct"
    puts "Please try again"
  end

  def choose_delivery_guys(employeecontroller)
    puts "choose a delivery guy :"
    employeecontroller.employees.each_with_index do |delivery_guy, index|
      puts "press #{index} for #{delivery_guy["username"]}"
    end
    choice = gets.chomp.to_i
    puts "You have chosen #{employeecontroller.employees[choice]["username"]}"
  end

end