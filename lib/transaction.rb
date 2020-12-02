class Transaction
  attr_reader :credit, :debit, :balance, :date

  def initialize(credit:, debit:, balance:, time_class: Time)
    @credit = credit
    @debit = debit
    @balance = balance
    @time_class = time_class
    @date = current_date(time_class)
  end

  private

  def current_date(time_class)
    time = time_class.new
    time.strftime('%d/%m/%Y')
  end
end