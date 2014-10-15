# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :password, :transactions, :position, :name, :iban
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  # - You can see the balance of the account (through the position variable)
  MIN_DEPOSIT =  100
  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    if (@position - amount) >= 0
      add_transaction(-amount)
      return "withdrawal of #{amount}$ accepted"
    else
      return "withdrawal of #{amount}$ refused - Insufficient funds"
    end
  end

  def deposit(amount)
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
    add_transaction(amount)
    return "deposit of #{amount}$ accepted"
  end

  def transactions_history(args = {})
    if args[:password] == @password
      return @transactions.join
    elsif !args.key?(:password)
      return "no password given"
    else
      return "wrong password"
    end
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array !
  end

  def iban
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
    return "#{@iban.split("")[0..3].join}*************#{@iban.split("")[30..32].join}"
  end

  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: Displays the account owner, the hidden iban and the position of the account
    return "#{@name} - #{iban} - #{@position} USD"
  end

  private

  def add_transaction(amount)
    # TODO: add the amount in the transactions array
    @position += amount
    @transactions.push(amount)
    # TODO: update the current position (which represents the balance of the account)
  end
end

myaccount = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")
p myaccount.to_s
myaccount.withdraw(200)
p myaccount.to_s
