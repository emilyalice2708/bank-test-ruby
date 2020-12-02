require 'printer'

describe Printer do
  describe '#print' do
    it 'prints a header' do
      expect { subject.print([]) }.to output("date || credit || debit || balance\n").to_stdout
    end
  end
end