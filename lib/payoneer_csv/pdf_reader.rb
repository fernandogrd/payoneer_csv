module PayoneerCsv

  class PdfReader
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def read
      transactions = []

      raw_data.each_line do |row|
        match_data = parse(row)
        next unless match_data

        transactions << Transaction.new(match_data)
      end

      transactions
    end

    def raw_data
      `less #{file_path}`
    end

    def parse(row)
      row.match /^(?<created_at>\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}:\d{2} (AM|PM))\s+ (?<description>.+) (?<amount>-?(\d|,)+\.\d{2})\s+USD$/
    end
  end

end
