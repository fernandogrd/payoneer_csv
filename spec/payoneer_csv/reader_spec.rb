require 'spec_helper'

describe PayoneerCsv::Reader do
  let(:file_path) { File.join(File.dirname(__FILE__), '..', 'fixtures', 'Transactions.pdf') }

  let(:reader) { described_class.new(file_path) }
  subject { reader }

  its(:file_path) { should == file_path }

  describe 'raw_data' do
    it { should respond_to(:raw_data) }

    describe 'result' do
      subject { reader.raw_data }

      it 'should include some transactions' do
        should_not be_empty
        should include('10/19/2012 11:38:12 PM         PSS SKLEP NR 54                          -17.36     USD')
        should include('10/19/2012 6:41:14 AM          COSTA COFFEE                              -7.41     USD')
        # ...
        should include('10/15/2012 8:44:18 AM          PKP Intercity                            -48.61     USD')
      end
    end
  end

  describe 'parse' do
    it { should respond_to(:parse) }

    describe 'result' do
      subject { reader.parse(row) }

      context 'on valid row' do
        let(:row) { '10/17/2012 5:58:20 AM          ATM Withdrawal - Vaci u. 42.             -75.29     USD' }

        it { should_not be_nil }
        its([:created_at]) { should == '10/17/2012 5:58:20 AM' }
        its([:description]) { should == 'ATM Withdrawal - Vaci u. 42.            ' }
        its([:amount]) { should == '-75.29' }
      end

      context 'on invalid row' do
        let(:row) { 'invalid transaction data' }

        it { should be_nil }
      end
    end
  end

  describe 'read' do
    it { should respond_to(:read) }

    describe 'result' do
      subject { reader.read }

      it { should have(7).items }
    end
  end
end
