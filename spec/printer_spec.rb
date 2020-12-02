require 'printer'

describe Printer do
  let(:transaction) { double :transaction, :date => '01/01/1010', :credit => '50', :debit => nil, :balance => '50'}
  describe '#print' do
    it 'prints a header' do
      expect { subject.print([]) }.to output("date || credit || debit || balance\n").to_stdout
    end

    it 'prints the statement' do
      expect { subject.print([transaction]) }.to output("date || credit || debit || balance\n01/01/1010 || 50 ||  || 50\n").to_stdout
    end
  end
end