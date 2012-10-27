require 'spec_helper'

describe PayoneerCsv::Transaction do
  let(:attributes) {
    {
      description: 'Sample transaction',
      amount: '2,123.99',
      created_at: '10/19/2012 11:38:12 PM'
    }
  }

  let(:transaction) { described_class.new(attributes) }
  subject { transaction }

  its(:description) { should == attributes[:description] }
  its(:amount) { should == 2_123.99 }
  its(:created_at) { should == attributes[:created_at] }

end
