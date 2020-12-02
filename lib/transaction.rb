class Transaction
  attr_reader :credit
  
  def initialize(credit:, debit:, balance:)
    @credit = credit
  end
end