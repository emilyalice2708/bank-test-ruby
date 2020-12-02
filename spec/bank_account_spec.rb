require 'bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:transaction_class) { double :transaction_class }

  it 'has an empty balance on initialization' do
    expect(account.balance).to eq 0
  end

  describe 'deposit' do
    it 'creates a new credit transaction' do
      expect(transaction_class).to receive(:new).with(30, "credit")
      account.deposit(30, transaction_class)
    end

    it 'increments balance by the deposit value' do
      account.deposit(30, transaction_class)
      expect(account.balance).to eq 30
    end
  end

  describe 'withdraw' do 
    it 'creates a new debit transaction' do
      expect(transaction_class).to receive(:new).with(10, "debit")
      account.withdraw(10, transaction_class)
    end

    it 'reduces balance by the withdrawal value' do
      amount.deposit(100, transaction_class)
      amount.withdraw(40, transaction_class)
      expect(account.balance).to eq(60)
    end
  end
end