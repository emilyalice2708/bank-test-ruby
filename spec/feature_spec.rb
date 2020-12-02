require 'bank_account'
require 'printer'
require 'transaction'

describe 'BankAccount' do
  let(:account) { BankAccount.new }
  it 'transactions are printed in reverse chronological order' do
    account.deposit(50)
    account.withdraw(30)
    expect {account.print_statement}.to output(
      "date || credit || debit || balance\n" +
      "02/12/2020 ||  || 30 || 20\n" +
      "02/12/2020 || 50 ||  || 50\n"
    ).to_stdout
  end

  it "prevents overdrafts" do
    account.deposit(50)
    expect { account.withdraw(60) }.to raise_error "Insufficient funds"
  end
end