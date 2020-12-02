require 'transaction'

describe 'Transaction' do
  describe '#initialize' do
    it 'stores the credit' do
      transaction = Transaction.new(credit: 50, debit: nil, balance: 50)
      expect(transaction.credit).to eq 50
    end

    it 'stores the debit' do
      transaction = Transaction.new(credit: 50, debit: nil, balance: 50)
      expect(transaction.debit).to eq nil
    end

    it 'stores the current balance' do
      transaction = Transaction.new(credit: 50, debit: nil, balance: 50)
      expect(transaction.balance).to eq 50
    end
  end
end