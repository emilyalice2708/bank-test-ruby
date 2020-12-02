require 'bank_account'
require 'printer'
require 'transaction'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:header) { "date || credit || debit || balance\n" }
  let(:first_transaction) { "02/12/2020 || 50 ||  || 50\n" }
  let(:second_transaction) { "02/12/2020 ||  || 30 || 20\n" }
  it 'transactions are printed in reverse chronological order' do
    account.deposit(50)
    account.withdraw(30)
    expect { account.print_statement }.to output(
      header +
      second_transaction +
      first_transaction
    ).to_stdout
  end

  it 'prevents overdrafts' do
    account.deposit(50)
    expect { account.withdraw(60) }.to raise_error "Insufficient funds"
  end
end
