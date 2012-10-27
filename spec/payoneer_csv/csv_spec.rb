require 'spec_helper'

describe PayoneerCsv::Csv do
  let(:first_transaction) { mock(created_at: '10/11/2011', description: 'Foo', amount: 123.12) }
  let(:second_transaction) { mock(created_at: '01/09/2012', description: 'Bar', amount: -9.99) }

  let(:transactions) { [first_transaction, second_transaction] }
  let(:csv) { described_class.new(transactions) }
  subject { csv }

  describe '#generate' do
    it { should respond_to(:generate) }

    describe 'result' do
      let(:csv_string) { csv.generate }
      subject { csv_string }

      it { should be_an_instance_of(String) }

      describe 'rows' do
        def nth_row(n)
          csv_string.split("\n")[n].split(',')
        end

        describe 'csv header' do
          subject { nth_row(0) }

          it { should have(4).items }

          its([0]) { should == 'Transaction Date' }
          its([1]) { should == 'Description' }
          its([2]) { should == 'Amount' }
          its([3]) { should == 'Currency' }
        end

        describe 'first row' do
          subject { nth_row(1) }

          it { should have(4).items }

          its([0]) { should == '10/11/2011' }
          its([1]) { should == 'Foo' }
          its([2]) { should == '123.12' }
          its([3]) { should == 'USD' }
        end

        describe 'second row' do
          subject { nth_row(2) }

          it { should have(4).items }

          its([0]) { should == '01/09/2012' }
          its([1]) { should == 'Bar' }
          its([2]) { should == '-9.99' }
          its([3]) { should == 'USD' }
        end
      end
    end
  end

end
