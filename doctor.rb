class Doctor
    attr_accessor :title, :employer, :multiplier

    def initialize(title, employer, multiplier)
        @title = title
        @employer = employer
        @multiplier = multiplier
    end
    
    def base_rate
        case @title
        when "GP"
            45
        when "Surgeon"
            60
        else
            0
        end
    end
end