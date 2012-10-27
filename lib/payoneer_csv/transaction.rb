module PayoneerCsv

  class Transaction
    attr_reader :description
    attr_reader :amount
    attr_reader :created_at

    def initialize(attributes)
      @created_at = attributes[:created_at]
      @description = attributes[:description].strip
      @amount = attributes[:amount].gsub(',', '').to_f
    end
  end

end
