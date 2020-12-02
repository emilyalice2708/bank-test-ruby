class Printer
  def print(statement)
    print_header
    statement.reverse.each do |transaction|
      puts "#{transaction.date} ||#{format(transaction.credit)} ||#{format(transaction.debit)} ||#{format(transaction.balance)}"
    end
  end

  def print_header
    puts 'date || credit || debit || balance'
  end

  def format(transaction_value)
    if !transaction_value.nil?
      " " + "%.2f" % transaction_value
    end
  end
end
