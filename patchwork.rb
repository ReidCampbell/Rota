require 'csv'
require_relative 'shift'


class Patchwork

    def initialize 
    
    @shift_one = Shift.new(1)
    @shift_two = Shift.new(2)

    end

    def generate_csv
        CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
        headers: ["Shift", "Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
        ) do |csv| 
            7.times do |time| 
                csv << [@shift_one.shift_number, csv_start_time(@shift_one, time), csv_end_time(@shift_one, time), @shift_one.total_hours]
                csv << [@shift_two.shift_number, csv_start_time(@shift_two, time), csv_end_time(@shift_two, time), @shift_two.total_hours]
            end
        end
    end


    def csv_start_time(shift, time)
        start_time = shift.shift_start_time + time.days
        shift.display_shift_time(start_time)
    end

    def csv_end_time(shift, time)
        end_time = shift.shift_end_time + time.days   
        shift.display_shift_time(end_time)
    end

    

end

make_csv = Patchwork.new
make_csv.generate_csv


