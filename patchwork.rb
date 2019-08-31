require 'csv'
require_relative 'shift'

class Patchwork

    def initialize 
       
    end

    def generate_csv
        weekend = ["Saturday", "Sunday"]
        CSV.open('WeeklyShiftReport.csv', 'w', write_headers: true,
        headers: ["Shift", "Start Date & Time", "End Date and Time", "Total Hours", "Shift Rate", "Total Payment", "Name of Agency/Hospital", "Name of Department"]
        ) do |csv| 
            Shift.shift_start_date.upto(Shift.shift_start_date + 7).each do |time| 
                @shift_one = Shift.new(1, time)
                @shift_two = Shift.new(2, time)
                unless weekend.include?(time.strftime("%A"))
                    csv << [@shift_one.shift_number, @shift_one.display_shift_time(@shift_one.shift_start_time)]
                    csv << [@shift_two.shift_number, @shift_two.display_shift_time(@shift_two.shift_start_time)]
                    # csv << [@shift_one.shift_number, @shift_one.shift_start_time.to_s, display_csv_end_time(@shift_one, time), @shift_one.total_hours, @shift_one.shift_rate(shift_day(@shift_one, time))]
                    # csv << [@shift_two.shift_number, time, display_csv_end_time(@shift_two, time), @shift_two.total_hours, @shift_two.shift_rate(shift_day(@shift_two, time))]
                end
            end
        end
    end

    def shift_day(shift, time)
        shift.shift_start_time + time.day
    end

    # def csv_end_time(shift, time)
    #     end_time = shift.shift_end_time + time.day
    # end

    # def display_csv_start_time(shift, time)
    #     start_time = shift.shift_start_time + time.day
    #     shift.display_shift_time(start_time)
    # end

    def display_csv_end_time(shift, time)
        end_time = shift.shift_end_time + time.day   
        shift.display_shift_time(end_time)
    end
end

make_csv = Patchwork.new
make_csv.generate_csv


