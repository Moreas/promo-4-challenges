class Customer
  attr_reader :id, :name, :address, :phone

  def initialize(args = {})
    @id = args[:id].to_i
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
  end

  def to_s
    '%-5d %-20s %-50s %-10s' % [id, name, address, phone]
  end
end
