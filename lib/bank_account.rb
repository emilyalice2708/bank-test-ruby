require_relative 'transaction'
require_relative 'printer'

class BankAccount
  attr_reader :balance, :statement

  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(amount, transaction_class = Transaction)
    check_positive(amount)
    @balance += amount
    @statement << transaction_class.new(credit: amount, debit: nil, balance: @balance)
  end

  def withdraw(amount, transaction_class = Transaction)
    check_funds(amount)
    check_positive(amount)
    @balance -= amount
    @statement << transaction_class.new(credit: nil, debit: amount, balance: @balance)
  end

  def print_statement(printer_class = Printer)
    printer = printer_class.new
    printer.print(@statement)
  end

  private

  def check_funds(amount)
    raise 'Insufficient funds' if amount > @balance
  end

  def check_positive(amount)
    raise 'Cannot process negative value' if amount < 0
  end
end
