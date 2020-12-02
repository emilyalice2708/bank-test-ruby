class Printer 
  def print(statement)
    print_header
    statement.reverse.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end

  def print_header
    puts 'date || credit || debit || balance'
  end
end