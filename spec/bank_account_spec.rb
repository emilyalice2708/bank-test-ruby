require 'bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:transaction_class) { double :transaction_class }


  it 'has an empty balance on initialization' do
    expect(account.balance).to eq 0
  end

  describe 'deposit' do
    it 'creates a new transaction' do
      expect(transaction_class).to receive(:new).with(30, "credit")
      account.deposit(30, transaction_class)
    end
  end
end