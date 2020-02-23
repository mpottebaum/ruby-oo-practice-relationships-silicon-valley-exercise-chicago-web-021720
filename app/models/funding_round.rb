class FundingRound
    attr_reader :startup, :venture_capitalist, :type, :investment
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        self.investment = investment
        @@all << self
    end

    def self.all
        @@all
    end

    def investment=(investment)
        if investment > 0
            @investment = investment.to_f
        else
            raise ArgumentError.new("Investment must be greater than 0")
        end
    end
end
