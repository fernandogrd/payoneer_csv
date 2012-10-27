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

      it 'should include all transactions' do
        parsed = CSV.parse(csv_string)

        parsed.should have(2).items

        first_row = parsed[0]
        created_at, description, amount, currency = *first_row
        created_at.should == '10/11/2011'
        description.should == 'Foo'
        amount.should == '123.12'
        currency.should == 'USD'

        second_row = parsed[1]
        created_at, description, amount, currency = *second_row
        created_at.should == '01/09/2012'
        description.should == 'Bar'
        amount.should == '-9.99'
        currency.should == 'USD'
      end
    end
  end

end
