require 'spec_helper'

describe PayoneerCsv::Transaction do
  let(:attributes) {
    {
      description: 'Sample transaction',
      amount: '123.99',
      created_at: '10/19/2012 11:38:12 PM'
    }
  }

  let(:transaction) { described_class.new(attributes) }
  subject { transaction }

  its(:description) { should == attributes[:description] }
  its(:amount) { should == attributes[:amount].to_f }
  its(:created_at) { should == attributes[:created_at] }

  describe '#direction' do
    it { should respond_to(:direction) }

    context 'when an amount is positive' do
      before { attributes[:amount] = 123 }

      it 'should return :deposit' do
        expect(transaction.direction).to eq(:deposit)
      end
    end

    context 'when an amount is negative' do
      before { attributes[:amount] = -123 }

      it 'should return :withdrawal' do
        expect(transaction.direction).to eq(:withdrawal)
      end
    end
  end

  describe '#created_on' do
    it { should respond_to(:direction) }

    it 'should return only date' do
      expect(transaction.created_on).to eq('10/19/2012')
    end
  end

end
