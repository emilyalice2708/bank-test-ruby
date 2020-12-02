require 'transaction'

describe 'Transaction' do
  context 'when credit' do
    it 'stores the amount in the credit instance variable' do
      transaction = Transaction.new(credit: 50, debit: nil, balance: 50)
      expect(transaction.credit).to eq 50
    end
  end
end