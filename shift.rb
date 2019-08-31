require 'active_support/time'

class Shift
    attr_reader :shift_number
    def initialize(shift_number)
        @shift_number = shift_number
    end
    
    def shifts
        { 1 => { start: 9.00, end: 15.00 },
          2 => { start: 20.00, end: 8.00 }
        }
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

    def shift_end_time
        if @shift_number == 1
            shift_start_time + 6.hours
        elsif @shift_number == 2
            shift_start_time + 12.hours
        else
            "Time Unknown"
        end
    end

    def display_shift_end_time
        shift_end_time.strftime("%d-%m-%Y %H:%M")
    end

    



end

