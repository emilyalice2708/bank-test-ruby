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
    @statement << transaction_class.new(credit: amount, debit: 0, balance: @balance)
  end

  def withdraw(amount, transaction_class = Transaction)
    @balance -= amount
    @statement << transaction_class.new(credit: 0, debit: amount, balance: @balance)
  end
end