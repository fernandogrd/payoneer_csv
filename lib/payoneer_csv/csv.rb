module PayoneerCsv

  class Csv
    attr_reader :transactions

    def initialize(transactions)
      @transactions = transactions
    end

    def generate
      CSV.generate do |csv|
        transactions.each do |transaction|
          csv << row_for(transaction)
        end
      end
    end

    private

    def row_for(transaction)
      row = [:created_at, :description, :amount].map { |field| transaction.send(field) }
      row << 'USD'
    end
  end

end
