class Employee
  attr_reader :id, :login, :password, :role

  def initialize(args = {})
    @id = args[:id].to_i
    @login = args[:login]
    @password = args[:password]
    @role = args[:role]
  end

  def manager?
    role == 'manager'
  end

  def to_s
    '%-5d %-20s %s' % [id, login, role]
  end
end
