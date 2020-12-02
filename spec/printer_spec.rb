require 'printer'

describe Printer do
  let(:transaction) { double :transaction, date: '01/01/1010', credit: '50', debit: nil, balance: '50' }
  describe '#print' do
    let(:expected_header) { "date || credit || debit || balance\n" }
    let(:expected_statement) { "01/01/1010 || 50.00 ||  || 50.00\n" }
    it 'prints a header' do
      expect { subject.print([]) }.to output(expected_header).to_stdout
    end

    it 'prints the statement' do
      expect { subject.print([transaction]) }.to output(expected_header + expected_statement).to_stdout
    end
  end
end
