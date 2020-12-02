class Printer
  def print(statement)
    print_header
    statement.reverse.each do |transaction|
      puts "#{transaction.date} ||#{format(transaction.credit)} ||#{format(transaction.debit)} ||#{format(transaction.balance)}"
    end
  end

  private

  def print_header
    puts 'date || credit || debit || balance'
  end

  def format(transaction_value)
    " " + "%.2f" % transaction_value if !transaction_value.nil?
  end
end
