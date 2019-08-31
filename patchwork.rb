require 'csv'
require_relative 'shift'
require_relative 'doctor'

class Patchwork
    def generate_csv
        weekend = ["Saturday", "Sunday"]
        CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
        headers: ["Shift", "Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
        ) do |csv| 
            Shift.shift_start_date.upto(Shift.shift_start_date + 7).each do |time| 
                @shift_one = Shift.new(1, time)
                @shift_two = Shift.new(2, time)

                unless weekend.include?(time.strftime("%A"))
                    csv << [@shift_one.shift_number, @shift_one.display_shift_time(@shift_one.shift_start_time), @shift_one.display_shift_time(@shift_one.shift_end_time), @shift_one.total_hours, @shift_one.shift_rate, @shift_one.doctor.employer, @shift_one.department]
                    csv << [@shift_two.shift_number, @shift_two.display_shift_time(@shift_two.shift_start_time), @shift_two.display_shift_time(@shift_two.shift_end_time), @shift_two.total_hours,  @shift_two.shift_rate, @shift_two.doctor.employer, @shift_two.department]
                end
            end
        end
    end

    def shift_day(shift, time)
        shift.shift_start_time + time.day
    end

    def display_csv_end_time(shift, time)
        end_time = shift.shift_end_time + time.day   
        shift.display_shift_time(end_time)
    end

    
end

make_csv = Patchwork.new
make_csv.generate_csv


