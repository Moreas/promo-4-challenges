class Meal
  attr_reader :id, :name, :price

  def initialize(args = {})
    @id = args[:id]
    @name = args[:name]
    @price = args[:price].to_i
  end

  def to_s
    '%-5d %-20s %5d€' % [id, name, price]
  end
end
