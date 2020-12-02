class BankAccount
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount, transaction_class = Transaction)
    transaction_class.new(amount, "credit")
  end
end