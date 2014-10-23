class Order
  attr_reader :id, :customer, :employee, :meals

  def initialize(args = {})
    @id = args[:id]
    @customer = args[:customer]
    @employee = args[:employee]
    @meals = args[:meals]
  end

  def customer_id
    customer.id
  end

  def employee_id
    employee.id
  end

  def meal_ids
    meals.map(&:id).join(' ')
  end

  def to_s
    format = <<-END.gsub(/^\s+/, '')
      Order: #{id}
      Customer: #{customer.name} | #{customer.address} | #{customer.phone}
      Delivered by: #{employee.login}
      Meals:
      ---
      #{formatted_meals}
      TOTAL                      %5d€
    END
    format % [total]
  end

  private

  def formatted_meals
    meals.map(&:to_s).join("\n")
  end

  def total
    meals.map(&:price).reduce(0, :+)
  end
end
