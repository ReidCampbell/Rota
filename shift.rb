class Shift
    attr_reader :shift_number
    def initialize(shift_number)
        @shift_number = shift_number
    end

    def shift_number
        case @shift_number
        when 1
            "Shift 1"
        when 2
            "Shift 2"
        else
            "Shift Unknown"
        end
    end
end

