require 'bank_account'

describe 'BankAccount' do
  let(:account) {BankAccount.new}

  it 'has an empty balance on initialization' do
    expect(account.balance).to eq 0
  end
end