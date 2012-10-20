require 'debugger'
require 'pdf-reader'
require 'ap'

def is_transaction_row?(row)
  start_with_date = /^\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}:\d{2}/
  row.match(start_with_date)
end

raw_transactions = []
File.open("Transcations.pdf", "rb") do |io|
  reader = PDF::Reader.new(io)
  
  reader.pages.each do |page|
    page.text.each_line do |row|
      raw_transactions << row if is_transaction_row?(row)
    end
  end
end

ap raw_transactions
