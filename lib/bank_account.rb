class BankAccount
  def initialize
    @balance = 0
  end

  def balance
    @balance
  end

  def deposit(amount, transaction_class = Transaction)
    @balance += amount
    transaction_class.new(amount, "credit")
  end

  def withdraw(amount, transaction_class = Transaction)
    @balance -= amount
    transaction_class.new(amount, "debit")
  end
end