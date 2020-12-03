require 'bank_account'
require 'printer'
require 'transaction'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  let(:header) { "date || credit || debit || balance\n" }
  let(:first_transaction) { "01/01/1010 || 50.00 || || 50.00\n" }
  let(:second_transaction) { "01/01/1010 || || 30.00 || 20.00\n" }
  let(:time) { Time }
  let(:date) { double :date, strftime: '01/01/1010' }

  it 'transactions are printed in reverse chronological order' do
    allow(time).to receive(:new).and_return(date)
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
