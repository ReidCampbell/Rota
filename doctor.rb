class Doctor
    attr_accessor :title, :employer

    def initialize(title, employer)
        @title = title
        @employer = employer
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