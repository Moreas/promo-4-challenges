require 'date'
require 'time'

# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Date.today
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    return "{@amount.to_s}"
  end
end
