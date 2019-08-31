require 'active_support/time'
require 'pry'

class Shift
    attr_reader :shift_number

    def initialize(shift_number, time, doctor)
        @shift_number = shift_number
        @time = time
        @doctor = doctor
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
        total_difference = shift_end_time.to_i - shift_start_time.to_i
        total_difference / 3600
    end

    def shift_rate
      m_w_f = ["Monday", "Wednesday", "Friday"]
        if m_w_f.include?(get_day)
            45
        else
            60
        end
    end

    def get_day
      @time.strftime("%A")
    end

    def department
        if @shift_number == 1
            "General Medicine"
        else
            "A&E"
        end
    end
    
end

