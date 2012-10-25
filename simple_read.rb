require 'base64'
require 'debugger'
require 'ap'

def is_transaction_row?(row)
  start_with_date = /^\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}:\d{2}/
  row.match(start_with_date)
end

class Transaction
  attr_reader :created_at
  attr_reader :created_on
  attr_reader :description
  attr_reader :amount

  def initialize(attributes)
    @created_at = attributes[:created_at]
    @created_on = attributes[:created_on]
    @description = attributes[:description].strip
    @amount = attributes[:amount].to_f
  end

  def direction
    amount >=0 ? :deposit : :withdrawal
  end

  def created_on
    month, day, year = @created_on.split('/')
    "#{day}-#{month}-#{year}"
  end

  def to_hash
    Hash.new.tap do |hash|
      hash[:created_on] = created_on
      hash[:description] = description
      hash[:amount] = amount
      hash[:direction] = direction
    end
  end
end

transactions = []

raw_data = `less spec/fixtures/Transactions.pdf`
raw_data.each_line do |row|
  match_data = row.match \
    /^(?<created_at>(?<created_on>\d{1,2}\/\d{1,2}\/\d{4}) \d{1,2}:\d{2}:\d{2} (AM|PM))\s+ \
      (?<description>.+) \
      (?<amount>-?(\d|,)+\.\d{2})\s+USD/
  next unless match_data

  transactions << Transaction.new(match_data)
end

ap transactions.map(&:to_hash)
