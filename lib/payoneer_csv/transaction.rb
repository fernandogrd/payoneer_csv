module PayoneerCsv

  class Transaction
    attr_reader :description
    attr_reader :amount
    attr_reader :created_at

    def initialize(attributes)
      @created_at = attributes[:created_at]
      @description = attributes[:description].strip
      @amount = attributes[:amount].to_f
    end

    def direction
      amount >=0 ? :deposit : :withdrawal
    end

    def created_on
      created_at.split(/\s/).first
    end
  end

end
