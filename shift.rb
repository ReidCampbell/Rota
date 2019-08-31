require 'active_support/time'
require 'pry'

class Shift
    attr_reader :shift_number

    def initialize(shift_number, time)
        @shift_number = shift_number
        @time = time
    end
    
    def shifts
        { 1 => { start: "9:00", end: "15:00" },
          2 => { start: "20:00", end: "8:00" }
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
    
    def display_shift_time(time)
        time.strftime("%d-%m-%Y %H:%M")
    end

    def shift_start_time
       t = @time.to_s + " " + shifts[@shift_number][:start]
       t.to_datetime

    end

    def self.shift_start_date
        Date.new(2018, 10, 17)
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

    def total_hours
        hours = shift_end_time - shift_start_time
        hours / 3600
    end

    def shift_rate(day)
        if day.monday? || day.wednesday? || day.friday?
            45
        elsif day.tuesday? || day.thursday?
            60
        else
            0
        end
    end
    
end

