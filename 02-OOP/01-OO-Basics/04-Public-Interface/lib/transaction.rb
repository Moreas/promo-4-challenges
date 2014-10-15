require 'time'

# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date = Time.now
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.
    return "#{@amount.to_s}USD #{@date.strftime("on %m/%d/%Y")}"
  end
end

mytransaction = Transaction.new(2000)
p mytransaction.to_s
