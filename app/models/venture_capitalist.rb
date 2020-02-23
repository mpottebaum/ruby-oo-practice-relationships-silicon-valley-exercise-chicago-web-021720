class VentureCapitalist
    attr_accessor :total_worth
    attr_reader :name

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
    end

    def self.all
        FundingRound.all.collect {|round| round.venture_capitalist}.uniq
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth >= 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.collect {|round| round.startup}.uniq
    end

    def biggest_investment
        self.funding_rounds.max do |a, b|
            a.investment <=> b.investment
        end
    end

    def invested(domain)
        rounds_with_domain = self.funding_rounds.select {|round| round.startup.domain == domain}
        rounds_with_domain.collect {|round| round.investment}.sum
    end
end
