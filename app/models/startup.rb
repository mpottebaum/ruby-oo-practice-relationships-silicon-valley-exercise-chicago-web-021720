class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    def initialize(founder, name, domain)
        @founder = founder
        @name = name
        @domain = domain
    end

    def self.all
        FundingRound.all.collect {|round| round.startup}.uniq
    end

    def self.find_by_founder(founder)
        self.all.find {|startup| startup.founder == founder}
    end

    def self.domains
        self.all.collect {|startup| startup.domain}.uniq
    end

    def pivot(name, domain)
        self.name = name
        self.domain = domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.startup == self}
    end

    def num_funding_rounds
        self.funding_rounds.length
    end
    
    def total_funds
        all_investments = self.funding_rounds.collect {|round| round.investment}
        all_investments.sum
    end

    def investors
        self.funding_rounds.collect {|round| round.venture_capitalist}.uniq
    end

    def big_investors
        #find the startup's investors
        #find all investors in tres comma club
        #return only startup's investors who also appear in tres comma array
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.any?(investor) == true
        end
    end

    private

    def domain=(domain)
        @domain = domain
    end
end
