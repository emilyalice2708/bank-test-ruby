class BankAccount
  def initialize
    @balance = 0
    @statement = []
  end

  def balance
    @balance
  end

  def statement
    @statement
  end

  def deposit(amount, transaction_class = Transaction)
    @balance += amount
    @statement << transaction_class.new(amount, "credit")
  end

  def withdraw(amount, transaction_class = Transaction)
    @balance -= amount
    transaction_class.new(amount, "debit")
  end
end