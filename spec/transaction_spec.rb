require 'transaction'

describe 'Transaction' do
  let(:current_date) { double :current_date }
  let(:time_class) { double :time }

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

    it 'stores the date' do
      allow(time_class).to receive(:new).and_return(current_date)
      allow(current_date).to receive(:strftime).with("%d/%m/%Y").and_return('01/01/1010')
      transaction = Transaction.new(credit: 50, debit: nil, balance: 50, time_class: time_class)
      expect(transaction.date).to eq('01/01/1010')
    end
  end
end