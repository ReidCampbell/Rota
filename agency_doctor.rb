class AgencyDoctor < Doctor
    attr_accessor :title, :employer, :multiplier

    def initialize(title, employer, multiplier)
        @title = title
        @employer = employer
        @multiplier = multiplier
    end


end