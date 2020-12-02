require 'bank_account'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:transaction) { double :transaction }

  it 'has an empty balance on initialization' do
    expect(account.balance).to eq 0
  end

  describe 'deposit' do
    it 'creates a new transaction' do
      
    end
  end
end