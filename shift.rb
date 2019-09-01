require 'active_support/time'
require_relative "doctor"

class Shift
    attr_accessor :doctor

    def initialize(shift_number, time)
        @shift_number = shift_number
        @time = time
        @doctor = shift_doctor
    end
    
    def display_shift_time(time)
        time.strftime("%d-%m-%Y %H:%M")
    end
    
    def shift_start_time
        start_time = "#{@time.to_s} #{shifts[@shift_number][:start]}"
        start_time.to_datetime
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
        m_w_f.include?(get_day) ? 45 : 60
    end
    
    def department
        @shift_number == 1 ? "General Medicine" : "A&E"
    end
    
    def total_shift_payment
        if @shift_number == 1
            shift_one_payment
        elsif @shift_number == 2
            shift_two_payment
        end
    end
    
private
    
    def shifts
        { 1 => { start: "9:00", end: "15:00" },
          2 => { start: "20:00", end: "8:00" }
        }
    end

    def get_day
      @time.strftime("%A")
    end

    def m_w_f
        ["Monday", "Wednesday", "Friday"]
    end
    
    def shift_doctor
        if m_w_f.include?(get_day) && @shift_number == 1
            @doctor = Doctor.new("GP", "MWF Hospital", 1) 
        elsif m_w_f.include?(get_day) && @shift_number == 2
            @doctor = Doctor.new("GP", "MWF Agency", 1.8)
        elsif !m_w_f.include?(get_day) && @shift_number == 1
            @doctor = Doctor.new("Surgeon", "TT Agency", 1.3)
        else
            @doctor = Doctor.new("Surgeon", "TT Hospital", 1)
        end
    end
    
    def shift_one_payment
        shift_rate = @doctor.base_rate * @doctor.multiplier
        shift_rate * total_hours
    end

    def shift_two_payment
        if @doctor.multiplier != 1
            shift_rate = @doctor.base_rate * @doctor.multiplier
            department_enchancer = @doctor.base_rate * 1.5
            (shift_rate + department_enchancer) * total_hours
        else 
            (@doctor.base_rate * 1.5) * total_hours
        end
    end
end

