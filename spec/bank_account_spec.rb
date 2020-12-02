require 'bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:transaction) { double :transaction }
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:printer) { double :printer }
  let(:printer_class) { double :printer_class, new: printer }

  describe '#deposit' do
    it 'creates a new credit transaction' do
      expect(transaction_class).to receive(:new).with(credit: 30, debit: nil, balance: 30)
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

    it 'prevents the user from depositing negative values' do
      expect { account.deposit(-100) }.to raise_error 'Cannot process negative value'
    end
  end

  describe '#withdraw' do
    it 'creates a new debit transaction' do
      account.deposit(30, transaction_class)
      expect(transaction_class).to receive(:new).with(credit: nil, debit: 10, balance: 20)
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

    it 'prevents withdrawals when value is more than current balance' do
      account.deposit(40, transaction_class)
      expect { account.withdraw(50, transaction_class) }.to raise_error 'Insufficient funds'
    end

    it 'prevents the user from withdrawing negative values' do
      account.deposit(100, transaction_class)
      expect { account.withdraw(-10) }.to raise_error 'Cannot process negative value'
    end
  end

  describe '#printer' do
    it 'creates a new printer' do
      allow(printer).to receive(:print)
      expect(printer_class).to receive(:new)
      account.print_statement(printer_class)
    end

    it 'prints the statement' do
      account.deposit(50, transaction_class)
      expect(printer).to receive(:print).with([transaction])
      account.print_statement(printer_class)
    end
  end
end
