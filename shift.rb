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
    
    def display_shift_start_time
        shift_start_time.strftime("%d-%m-%Y %H:%M")
    end

    def shift_start_time
        Time.new(2018, 10, 17, shifts[@shift_number][:start])
    end

    def shifts
        { 1 => { start: 9.00, end: 15.00 },
          2 => { start: 20.00, end: 8.00 }
        }
    end
end

