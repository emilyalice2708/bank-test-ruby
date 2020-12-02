require 'bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, :new => transaction }

  it 'has an empty balance on initialization' do
    expect(account.balance).to eq 0
  end

  describe 'deposit' do
    it 'creates a new credit transaction' do
      expect(transaction_class).to receive(:new).with(credit: 30, debit: 0, balance: 30)
      account.deposit(30, transaction_class)
    end

    it 'increments balance by the deposit value' do
      account.deposit(30, transaction_class)
      expect(account.balance).to eq 30
    end

    it 'adds the transaction to the statement array' do
      account.deposit(30, transaction_class)
      expect(account.statement).to include(transaction)
    end
  end

  describe 'withdraw' do 
    it 'creates a new debit transaction' do
      account.deposit(30, transaction_class)
      expect(transaction_class).to receive(:new).with(credit: 0, debit: 10, balance: 20)
      account.withdraw(10, transaction_class)
    end

    it 'reduces balance by the withdrawal value' do
      account.deposit(100, transaction_class)
      account.withdraw(40, transaction_class)
      expect(account.balance).to eq(60)
    end

    it 'adds the transaction to the statement array' do
      account.deposit(50, transaction_class)
      account.withdraw(30, transaction_class)
      expect(account.statement.count(transaction)).to eq 2
    end
  end
end